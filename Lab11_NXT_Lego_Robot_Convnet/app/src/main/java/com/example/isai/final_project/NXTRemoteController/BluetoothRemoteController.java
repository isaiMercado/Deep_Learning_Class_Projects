package com.example.isai.final_project.NXTRemoteController;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.Intent;

import java.util.Set;

/**
 * Created by isai on 11/24/16.
 */

public class BluetoothRemoteController implements RemoteController {

    private NXTBluetoothTalker bluetoothTalker;
    private BluetoothAdapter bluetoothAdapter;

    public BluetoothRemoteController() {
        try {
            bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();

            BluetoothDevice bluetoothDevice = null;
            Set<BluetoothDevice> pairedDevices = bluetoothAdapter.getBondedDevices();
            for (BluetoothDevice device : pairedDevices) {
                if(device.getAddress().equals("00:16:53:15:6F:12")) {
                    bluetoothDevice = device;
                    break;
                }
            }

            //String address = "00:16:53:15:6F:12";
            //BluetoothDevice bluetoothDevice = bluetoothAdapter.getRemoteDevice(address);
            bluetoothTalker = new NXTBluetoothTalker(bluetoothDevice);
        } catch (Exception e) {
            System.out.print("NXT Robot not found");
            e.printStackTrace();
        }
    }

    @Override
    public void up() {
        byte left = (byte)80;
        byte right = (byte)80;
        boolean speed_reg = false;
        boolean sync_motors = false;

        bluetoothTalker.motors(left, right, speed_reg, sync_motors);

    }

    @Override
    public void down() {
        byte left = (byte)-80;
        byte right = (byte)-80;
        boolean speed_reg = false;
        boolean sync_motors = false;

        bluetoothTalker.motors(left, right, speed_reg, sync_motors);
    }

    @Override
    public void left() {
        byte left = (byte)-48;
        byte right = (byte)48;
        boolean speed_reg = false;
        boolean sync_motors = false;

        bluetoothTalker.motors(left, right, speed_reg, sync_motors);
    }

    @Override
    public void right() {
        byte left = (byte)48;
        byte right = (byte)-48;
        boolean speed_reg = false;
        boolean sync_motors = false;

        bluetoothTalker.motors(left, right, speed_reg, sync_motors);
    }

    @Override
    public void stop() {
        bluetoothTalker.motors((byte)0, (byte)0, false, false);
    }
}
