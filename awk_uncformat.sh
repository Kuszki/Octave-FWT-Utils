#!/usr/bin/awk -f

BEGIN { FS="\t"; OFS="\t"; FRAC = 2; REM = 2; }

{
	 for (i = 2; i <= NF; i += 2) {

		val = $i; unc = $(i+1);

		val_abs = (val < 0 ? -val : val)
		unc_abs = (unc < 0 ? -unc : unc)

		b_rounded = sprintf("%." REM "g", unc) + 0.0

		match(b_rounded, /\.(.*)/, dec)
		decimal_places = (RLENGTH > 0) ? length(dec[1]) : 0

	if (unc_abs < 1.0 || decimal_places >= FRAC) {

		format = "%" FRAC "." FRAC "f"
		b_rounded = sprintf(format, unc)
		a_rounded = sprintf(format, val)

	} else if (decimal_places == 0) {

		l1 = length(sprintf("%0.0f", val))
		l2 = length(b_rounded)

		format = "%2." (l1 - l2 + REM) "g"
		a_rounded = sprintf(format, val) + 0.0

	} else {

		format = "%." decimal_places "f"
		a_rounded = sprintf(format, val)

	}

		print OFS a_rounded OFS b_rounded

	}
}
