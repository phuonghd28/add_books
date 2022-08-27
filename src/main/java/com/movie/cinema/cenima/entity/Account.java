package com.movie.cinema.cenima.entity;

import java.sql.Date;

public class Account {

    private String id;
    private String username;
    private String password;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public static final class AccountBuilder {
        private String id;
        private String username;
        private String password;

        private AccountBuilder() {
        }

        public static AccountBuilder anAccount() {
            return new AccountBuilder();
        }

        public AccountBuilder withId(String id) {
            this.id = id;
            return this;
        }

        public AccountBuilder withUsername(String username) {
            this.username = username;
            return this;
        }

        public AccountBuilder withPassword(String password) {
            this.password = password;
            return this;
        }

        public Account build() {
            Account account = new Account();
            account.setId(id);
            account.setUsername(username);
            account.setPassword(password);
            return account;
        }
    }
}
