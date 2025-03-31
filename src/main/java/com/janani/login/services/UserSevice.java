package com.janani.login.services;

import com.janani.login.constant.CommenConstant;
import com.janani.login.model.User;
import com.opencsv.CSVReader;
import com.opencsv.CSVWriter;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

public class UserSevice {
    private static List<User> users;
    private static  UserSevice userSevice;
    private final String csvFile = CommenConstant.FILE_DB_FOLDER+CommenConstant.USER_DB_FILE;

    public static UserSevice getUserService(){
        if(UserSevice.userSevice == null){
            UserSevice.userSevice = new UserSevice();
        }
        return UserSevice.userSevice;
    }

    private UserSevice() {
        if (UserSevice.users == null || UserSevice.users.isEmpty()) {
//            this.csvFile=this.getClass().getResource("/userData.csv").getFile();
            this.readAllUser();
        }

    }

    public List<User> getAllUsers(){
        return UserSevice.users;
    }

    private void readAllUser(){
        UserSevice.users = new ArrayList<>();
        try {
            CSVReader csvReader = new CSVReader(new FileReader(this.csvFile));
            String[] nextRecord;
            while ((nextRecord = csvReader.readNext()) != null) {
                if(nextRecord.length >= 5){
                    UserSevice.users.add(new User(nextRecord[0],nextRecord[1],nextRecord[2],nextRecord[3],nextRecord[4]));
                }
            }
            if(UserSevice.users.size() > 0){
                UserSevice.users.remove(0);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    public User login(User user) {
        for (int i = 0; i < UserSevice.users.size(); i++) {
            User u1 = UserSevice.users.get(i);
            if (u1.getUsername().equals(user.getUsername()) && u1.comparePassword(user)) {
                u1.setLoginStatus(true);
                return u1;
            }
        }
        user.setLoginStatus(false);
        return user;

    }
    public boolean isExistUserName(User user) {
        for (int i = 0; i < UserSevice.users.size(); i++) {
            User u1 = UserSevice.users.get(i);
            if (u1.getUsername().equalsIgnoreCase(user.getUsername())) {
                return true;
            }
        }
        return false;
    }

    public boolean addUser(User user) {
        try{
            CSVWriter writer = new CSVWriter(new FileWriter(this.csvFile, true));
            writer.writeNext(user.getCsvRow());
            writer.close();
            UserSevice.users.add(user);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
