package com.example.pi.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;

@RestController
public class PiController {

    @GetMapping("/pi")
    public String calculatePi(@RequestParam(defaultValue = "10") int digits) {
        int scale = digits + 5;
        BigDecimal pi = BigDecimal.ZERO;
        BigDecimal one = BigDecimal.ONE;

        for (int k = 0; k < 10000; k++) {
            BigDecimal numerator = (k % 2 == 0) ? one : one.negate();
            BigDecimal denominator = new BigDecimal(2 * k + 1);
            BigDecimal term = numerator.divide(denominator, scale, RoundingMode.HALF_UP);
            pi = pi.add(term);
        }

        pi = pi.multiply(new BigDecimal(4), new MathContext(scale, RoundingMode.HALF_UP));
        pi = pi.setScale(digits, RoundingMode.HALF_UP);

        return String.format("π 保留小数点后 %d 位为：%s", digits, pi.toPlainString());
    }
}
