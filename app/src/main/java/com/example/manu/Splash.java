package com.example.manu;

import android.content.Intent;
import android.os.Bundle;

import androidx.appcompat.app.AppCompatActivity;

import com.daimajia.androidanimations.library.Techniques;
import com.daimajia.androidanimations.library.YoYo;


public class Splash extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.splash);
        YoYo.with(Techniques.FadeIn)
                .duration(1500)
                .playOn(findViewById(R.id.logosplash));
        YoYo.with(Techniques.Flash)
                .duration(500)
                .repeat(10)
                .playOn(findViewById(R.id.pointsplash));

        Thread splash = new Thread() {

            @Override
            public void run() {
                try {

                    sleep(2000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                Intent main = new Intent(getApplicationContext(),MainActivity.class);
                startActivity(main);
                finish();
            }
        };
        splash.start();
    }
}
