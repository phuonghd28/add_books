package com.movie.cinema.cenima.util;

import java.sql.Timestamp;
import java.time.*;
import java.time.format.DateTimeFormatter;

public class HandlerDate {

    private static final String PATTERN_YMD = "yyyy-MM-dd";
    private static final String PATTERN_YMD_HM = "yyyy-MM-dd HH:mm";

    public static long convertLocalDateTimeToLong(LocalDateTime dateTime) {
        ZonedDateTime zdt = ZonedDateTime.of(dateTime, ZoneId.systemDefault());
        return zdt.toInstant().toEpochMilli();
    }

    public static LocalDate convertStringToLocalDate(String localDate) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(PATTERN_YMD);
        return LocalDate.parse(localDate, formatter);
    }

    public static long convertLocalDateToLong(LocalDate localDate) {
        ZonedDateTime zdt = ZonedDateTime.of(localDate.atStartOfDay(), ZoneId.systemDefault());
        return zdt.toInstant().toEpochMilli();
    }

    public static LocalDate convertLongToLocalDate(Long longTime) {
        return Instant.ofEpochMilli(longTime).atZone(ZoneId.systemDefault()).toLocalDate();
    }

    public static LocalDateTime convertLongToLocalDateTime(Long longTime) {
        LocalDateTime l = new Timestamp(longTime).toLocalDateTime();
        System.out.println(l);
        return l;
    }

    public static boolean compareWithCurrentDate(LocalDateTime localDateTime) {
        LocalDateTime currentDate = LocalDateTime.now();
        return localDateTime.isAfter(currentDate);
    }

    public static boolean compareTwoLocalDateTime(LocalDateTime end, LocalDateTime localDateTime) {
        return end.isAfter(localDateTime);
    }

    public static String convertMinuteToHour(int minute) {
        int hours = minute / 60;
        int minutes = minute % 60;
        return hours + " giờ " + minutes+ " phút";
    }

}
