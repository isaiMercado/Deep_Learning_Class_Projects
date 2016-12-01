package com.example.isai.final_project;

import com.example.isai.final_project.NXTRemoteController.BluetoothRemoteController;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

/**
 * Created by isai on 11/24/16.
 */

public class NXTRemoteControllerTest {
    @Test
    public void up() {
        BluetoothRemoteController remoteController = new BluetoothRemoteController();

        for (int i = 0; i < 10000; i++) {
            remoteController.up();
        }
    }
}
