package com.example.manu;

import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.daimajia.androidanimations.library.Techniques;
import com.daimajia.androidanimations.library.YoYo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class MainActivity extends AppCompatActivity {

    private static final String apiurl="http://10.0.2.2/manu/login.php";
    EditText t1,t2;
    TextView tv;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        YoYo.with(Techniques.SlideInUp)
                .duration(3000)
                .playOn(findViewById(R.id.imageView3));
    }
    public void login(View view)
    {
        t1=(EditText)findViewById(R.id.t1);
        t2=(EditText)findViewById(R.id.t2);
        tv=(TextView)findViewById(R.id.tv);

        final ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Connexion...");

        String qry="?t1="+t1.getText().toString().trim()+"&t2="+t2.getText().toString().trim();

        class dbprocess extends AsyncTask<String,Void,String>
        {
            @Override
            protected  void onPostExecute(String data)
            {
                if(data.equals("found"))
                {
                    progressDialog.show();
                    SharedPreferences sp=getSharedPreferences("credentials",MODE_PRIVATE);
                    SharedPreferences.Editor editor=sp.edit();
                    editor.putString("uname",t1.getText().toString());
                    editor.commit();
                    startActivity(new Intent(getApplicationContext(), IndexAS.class));
                }
                else if(data.equals("trouve"))
                {
                    progressDialog.show();
                    SharedPreferences sp=getSharedPreferences("credentials",MODE_PRIVATE);
                    SharedPreferences.Editor editor=sp.edit();
                    editor.putString("uname",t1.getText().toString());
                    editor.commit();
                    startActivity(new Intent(getApplicationContext(), IndexVE.class));
                }
                else if(data.equals("ok"))
                {
                    progressDialog.show();
                    SharedPreferences sp=getSharedPreferences("credentials",MODE_PRIVATE);
                    SharedPreferences.Editor editor=sp.edit();
                    editor.putString("uname",t1.getText().toString());
                    editor.commit();
                    startActivity(new Intent(getApplicationContext(), IndexOR.class));
                }
                else
                {
                    t1.setText("");
                    t2.setText("");
                    tv.setTextColor(Color.parseColor("#8B0000"));
                    tv.setText(data);
                }
            }
            @Override
            protected String doInBackground(String... params)
            {
                String furl=params[0];

                try
                {
                    URL url=new URL(furl);
                    HttpURLConnection conn=(HttpURLConnection)url.openConnection();
                    BufferedReader br=new BufferedReader(new InputStreamReader(conn.getInputStream()));

                    return br.readLine();

                }catch (Exception ex)
                {
                    return ex.getMessage();
                }
            }
        }

        dbprocess obj=new dbprocess();
        obj.execute(apiurl+qry);

    }
}