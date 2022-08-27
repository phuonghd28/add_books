package com.movie.cinema.cenima.entity;

public class Room {

    private String id;
    private String name;
    private int totalSeat;
    private String cinemaId;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTotalSeat() {
        return totalSeat;
    }

    public void setTotalSeat(int totalSeat) {
        this.totalSeat = totalSeat;
    }

    public String getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(String cinemaId) {
        this.cinemaId = cinemaId;
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

    public static final class RoomBuilder {
        private String id;
        private String name;
        private int totalSeat;
        private String cinemaId;
        private int status;
        private Long createDate;
        private Long updateDate;
        private Long deleteDate;

        private RoomBuilder() {
        }

        public static RoomBuilder aRoom() {
            return new RoomBuilder();
        }

        public RoomBuilder withId(String id) {
            this.id = id;
            return this;
        }

        public RoomBuilder withName(String name) {
            this.name = name;
            return this;
        }

        public RoomBuilder withTotalSeat(int totalSeat) {
            this.totalSeat = totalSeat;
            return this;
        }

        public RoomBuilder withCinemaId(String cinemaId) {
            this.cinemaId = cinemaId;
            return this;
        }

        public RoomBuilder withStatus(int status) {
            this.status = status;
            return this;
        }

        public RoomBuilder withCreateDate(Long createDate) {
            this.createDate = createDate;
            return this;
        }

        public RoomBuilder withUpdateDate(Long updateDate) {
            this.updateDate = updateDate;
            return this;
        }

        public RoomBuilder withDeleteDate(Long deleteDate) {
            this.deleteDate = deleteDate;
            return this;
        }

        public Room build() {
            Room room = new Room();
            room.setId(id);
            room.setName(name);
            room.setTotalSeat(totalSeat);
            room.setCinemaId(cinemaId);
            room.setStatus(status);
            room.setCreateDate(createDate);
            room.setUpdateDate(updateDate);
            room.setDeleteDate(deleteDate);
            return room;
        }
    }
}
