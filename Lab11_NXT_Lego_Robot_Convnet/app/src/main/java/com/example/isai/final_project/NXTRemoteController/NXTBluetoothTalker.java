package com.example.isai.final_project.NXTRemoteController;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.util.UUID;

/**
 * Created by isai on 11/24/16.
 */

public class NXTBluetoothTalker {


    private BluetoothAdapter bluetoothAdapter;
    private ConnectThread connectThread;
    private ConnectedThread connectedThread;


    public NXTBluetoothTalker(BluetoothDevice device) {
        bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        initConnectThread(device);
    }


    public synchronized void initConnectThread(BluetoothDevice device) {
        stopThreads();
        connectThread = new ConnectThread(device);
        connectThread.start();
    }


    public synchronized void initConnectedThread(BluetoothSocket socket) {
        stopThreads();
        connectedThread = new ConnectedThread(socket);
        connectedThread.start();
    }


    public synchronized void stopThreads() {
        if (connectThread != null) {
            //connectThread.close();
            connectThread = null;
        }

        if (connectedThread != null) {
            connectedThread.close();
            connectedThread = null;
        }
    }


    public void motors(byte l, byte r, boolean speedReg, boolean motorSync) {
        byte[] data = { 0x0c, 0x00, (byte) 0x80, 0x04, 0x02, 0x32, 0x07, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00,
                0x0c, 0x00, (byte) 0x80, 0x04, 0x01, 0x32, 0x07, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00 };

        data[5] = l;
        data[19] = r;
        if (speedReg) {
            data[7] |= 0x01;
            data[21] |= 0x01;
        }
        if (motorSync) {
            data[7] |= 0x02;
            data[21] |= 0x02;
        }

        writeToNXT(data);
    }


    public void motor(int motor, byte power, boolean speedReg, boolean motorSync) {
        byte[] data = { 0x0c, 0x00, (byte) 0x80, 0x04, 0x02, 0x32, 0x07, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00 };

        if (motor == 0) {
            data[4] = 0x02;
        } else {
            data[4] = 0x01;
        }
        data[5] = power;
        if (speedReg) {
            data[7] |= 0x01;
        }
        if (motorSync) {
            data[7] |= 0x02;
        }

        writeToNXT(data);
    }


    public void motors3(byte l, byte r, byte action, boolean speedReg, boolean motorSync) {
        byte[] data = { 0x0c, 0x00, (byte) 0x80, 0x04, 0x02, 0x32, 0x07, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00,
                0x0c, 0x00, (byte) 0x80, 0x04, 0x01, 0x32, 0x07, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00,
                0x0c, 0x00, (byte) 0x80, 0x04, 0x00, 0x32, 0x07, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00 };

        data[5] = l;
        data[19] = r;
        data[33] = action;
        if (speedReg) {
            data[7] |= 0x01;
            data[21] |= 0x01;
        }
        if (motorSync) {
            data[7] |= 0x02;
            data[21] |= 0x02;
        }

        writeToNXT(data);
    }


    private void writeToNXT(byte[] out)
    {
        try {
            connectedThread.write(out);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }






    private class ConnectThread extends Thread {
        private BluetoothSocket bluetoothSocket;
        private final BluetoothDevice bluetoothDevice;

        public ConnectThread(BluetoothDevice device) {
            bluetoothDevice = device;
        }

        public void run() {
            bluetoothAdapter.cancelDiscovery();

            try {
                bluetoothSocket = bluetoothDevice.createRfcommSocketToServiceRecord(UUID.fromString("00001101-0000-1000-8000-00805F9B34FB"));
                bluetoothSocket.connect();
            } catch (IOException e) {
                try {
                    Method method = bluetoothDevice.getClass().getMethod("createRfcommSocket", new Class[] { int.class });
                    bluetoothSocket = (BluetoothSocket) method.invoke(bluetoothDevice, Integer.valueOf(1));
                    bluetoothSocket.connect();
                } catch (Exception e1) {
                    e1.printStackTrace();
                    try {
                        bluetoothSocket.close();
                    } catch (IOException e2) {
                        e2.printStackTrace();
                    }
                    return;
                }
            }

            initConnectedThread(bluetoothSocket);
        }

        public void close() {
            try {
                if (bluetoothSocket != null) {
                    bluetoothSocket.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }







    private class ConnectedThread extends Thread {


        private final BluetoothSocket bluetoothSocket;
        private final InputStream inputStream;
        private final OutputStream outputStream;


        public ConnectedThread(BluetoothSocket socket) {
            bluetoothSocket = socket;
            InputStream tmpIn = null;
            OutputStream tmpOut = null;

            try {
                tmpIn = socket.getInputStream();
                tmpOut = socket.getOutputStream();
            } catch (IOException e) {
                e.printStackTrace();
            }

            inputStream = tmpIn;
            outputStream = tmpOut;
        }


        public void run() {
            byte[] buffer = new byte[1024];
            int bytes;

            while (true) {
                try {
                    bytes = inputStream.read(buffer);
                } catch (IOException e) {
                    Log.w("Isai", "Read ConnectedThread didn't work: "+ e.getMessage());
                    Log.d("Isai", Log.getStackTraceString(e));
                    break;
                }
            }
        }


        public void write(byte[] buffer) {
            try {
                outputStream.write(buffer);
            } catch (IOException e) {
                Log.w("Isai", "Write ConnectedThread didn't work: "+ e.getMessage());
                Log.d("Isai", Log.getStackTraceString(e));
            }
        }


        public void close() {
            try {
                bluetoothSocket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

}
