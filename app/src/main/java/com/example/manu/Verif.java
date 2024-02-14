package com.example.manu;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

public class Verif extends AppCompatActivity {

    EditText etRef,etQtreel;
    Button btnVerif;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_verif);

        etRef=findViewById(R.id.ref);
        etQtreel=findViewById(R.id.qtreel);
        btnVerif=findViewById(R.id.btnVerif);
        btnVerif.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                verifier();
            }
        });
    }


    private void verifier() {

        final String ref = etRef.getText().toString().trim();
        final String qteReel = etQtreel.getText().toString().trim();

        final ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Enregistrement...");

        if(ref.isEmpty()){
            Toast.makeText(this, "Entrez le numero de réference de la manutention", Toast.LENGTH_SHORT).show();
            return;
        }
        else if(qteReel.isEmpty()){
            Toast.makeText(this, "Entrez la quantité réelle executé", Toast.LENGTH_SHORT).show();
            return;
        }

        else{
            progressDialog.show();
            StringRequest request = new StringRequest(Request.Method.POST, "http://10.0.2.2/manu/verif.php",
                    new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {

                            if(response.equalsIgnoreCase("Enregistré")){
                                AlertDialog.Builder builder = new AlertDialog.Builder(Verif.this);
                                builder.setTitle("Succès").setMessage("Verification effectuée").create().show();
                                //Toast.makeText(Verif.this, "Verification effectuée", Toast.LENGTH_SHORT).show();
                                progressDialog.dismiss();
                            }
                            else{
                                Toast.makeText(Verif.this, response, Toast.LENGTH_SHORT).show();
                                progressDialog.dismiss();
                            }

                        }
                    }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                    Toast.makeText(Verif.this, error.getMessage(), Toast.LENGTH_SHORT).show();
                    progressDialog.dismiss();
                }
            }

            ){
                @Override
                protected Map<String, String> getParams() throws AuthFailureError {

                    Map<String,String> params = new HashMap<String,String>();

                    params.put("ref",ref);
                    params.put("qteReel",qteReel);

                    return params;
                }
            };


            RequestQueue requestQueue = Volley.newRequestQueue(Verif.this);
            requestQueue.add(request);

        }
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        finish();
    }
}