package com.movie.cinema.cenima.entity;

public class Store {

    private String id;
    private String roomId;
    private String movieId;
    private double unitPrice;
    private int totalTicket;
    private Long showTime;
    private int status;
    private Long createDate;
    private Long updateDate;
    private Long deleteDate;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getMovieId() {
        return movieId;
    }

    public void setMovieId(String movieId) {
        this.movieId = movieId;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getTotalTicket() {
        return totalTicket;
    }

    public void setTotalTicket(int totalTicket) {
        this.totalTicket = totalTicket;
    }

    public Long getShowTime() {
        return showTime;
    }

    public void setShowTime(Long showTime) {
        this.showTime = showTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Long getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Long createDate) {
        this.createDate = createDate;
    }

    public Long getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Long updateDate) {
        this.updateDate = updateDate;
    }

    public Long getDeleteDate() {
        return deleteDate;
    }

    public void setDeleteDate(Long deleteDate) {
        this.deleteDate = deleteDate;
    }

    public static final class StoreBuilder {
        private String id;
        private String roomId;
        private String movieId;
        private double unitPrice;
        private int totalTicket;
        private Long showTime;
        private int status;
        private Long createDate;
        private Long updateDate;
        private Long deleteDate;

        private StoreBuilder() {
        }

        public static StoreBuilder aStore() {
            return new StoreBuilder();
        }

        public StoreBuilder withId(String id) {
            this.id = id;
            return this;
        }

        public StoreBuilder withRoomId(String roomId) {
            this.roomId = roomId;
            return this;
        }

        public StoreBuilder withMovieId(String movieId) {
            this.movieId = movieId;
            return this;
        }

        public StoreBuilder withUnitPrice(double unitPrice) {
            this.unitPrice = unitPrice;
            return this;
        }

        public StoreBuilder withTotalTicket(int totalTicket) {
            this.totalTicket = totalTicket;
            return this;
        }

        public StoreBuilder withShowTime(Long showTime) {
            this.showTime = showTime;
            return this;
        }

        public StoreBuilder withStatus(int status) {
            this.status = status;
            return this;
        }

        public StoreBuilder withCreateDate(Long createDate) {
            this.createDate = createDate;
            return this;
        }

        public StoreBuilder withUpdateDate(Long updateDate) {
            this.updateDate = updateDate;
            return this;
        }

        public StoreBuilder withDeleteDate(Long deleteDate) {
            this.deleteDate = deleteDate;
            return this;
        }

        public Store build() {
            Store store = new Store();
            store.setId(id);
            store.setRoomId(roomId);
            store.setMovieId(movieId);
            store.setUnitPrice(unitPrice);
            store.setTotalTicket(totalTicket);
            store.setShowTime(showTime);
            store.setStatus(status);
            store.setCreateDate(createDate);
            store.setUpdateDate(updateDate);
            store.setDeleteDate(deleteDate);
            return store;
        }
    }
}
