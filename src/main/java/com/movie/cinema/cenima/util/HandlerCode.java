package com.movie.cinema.cenima.util;

public class
































HandlerCode {

    public static String convertCodeToString(int code) {
        switch (code) {
            case 1301:
                return "Kiểm tra lại thông tin tạo mới!";
            case 1302:
                return "Thời gian chiếu phải lớn hơn ngày hiện tại và thời gian công chiếu 1 ngày!";
            case 1303:
                return "Tổng số vé không được lớn hơn tổng số ghế hiện có!";
            case 1304:
                return "Thời gian chiếu phim trùng với phim khác!";
            case 200:
                return "Ok!";
            case 400:
                return "Vui lòng nhập đúng tài khoản mật khẩu!";
            case 500:
                return "Sever error!";
            default:
                return "Something when wrong!";
        }
    }
}
