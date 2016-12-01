package com.example.isai.final_project.main;

import android.bluetooth.BluetoothAdapter;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;

import com.example.isai.final_project.NXTRemoteController.BluetoothRemoteController;
import com.example.isai.final_project.NXTRemoteController.RemoteController;
import com.example.isai.final_project.R;

public class NXTTester extends AppCompatActivity {

    BluetoothRemoteController nxtRemoteController;
    BluetoothAdapter bluetoothAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_nxttester);
        bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();


        Button button_up = (Button) findViewById(R.id.button_up);
        button_up.setOnTouchListener(new Button.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                int action = event.getAction();
                if (action == MotionEvent.ACTION_DOWN) {
                    nxtRemoteController.up();
                } else if (action == MotionEvent.ACTION_UP) {
                    nxtRemoteController.stop();
                }
                return true;
            }
        });

        Button button_down = (Button) findViewById(R.id.button_down);
        button_down.setOnTouchListener(new Button.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                int action = event.getAction();
                if (action == MotionEvent.ACTION_DOWN) {
                    nxtRemoteController.down();
                } else if (action == MotionEvent.ACTION_UP) {
                    nxtRemoteController.stop();
                }
                return true;
            }
        });

        Button button_left = (Button) findViewById(R.id.button_left);
        button_left.setOnTouchListener(new Button.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                int action = event.getAction();
                if (action == MotionEvent.ACTION_DOWN) {
                    nxtRemoteController.left();
                } else if (action == MotionEvent.ACTION_UP) {
                    nxtRemoteController.stop();
                }
                return true;
            }
        });

        Button button_right = (Button) findViewById(R.id.button_right);
        button_right.setOnTouchListener(new Button.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                int action = event.getAction();
                if (action == MotionEvent.ACTION_DOWN) {
                    nxtRemoteController.right();
                } else if (action == MotionEvent.ACTION_UP) {
                    nxtRemoteController.stop();
                }
                return true;
            }
        });

        Button button_connect = (Button) findViewById(R.id.button_connect);
        button_connect.setOnClickListener(new Button.OnClickListener() {
            public void onClick(View v) {
                if (!bluetoothAdapter.isEnabled()) {
                    Intent enableBtIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
                    startActivityForResult(enableBtIntent, 0);
                }

                nxtRemoteController = new BluetoothRemoteController();
            }
        });

    }


}
