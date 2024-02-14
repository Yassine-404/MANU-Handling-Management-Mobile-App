package com.example.manu;

import androidx.appcompat.app.AppCompatActivity;

import android.Manifest;
import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.text.InputType;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfWriter;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class Add_manu extends AppCompatActivity {

    Spinner spinnerExercice;
    ArrayList<String> exerciceList = new ArrayList<>();
    ArrayAdapter<String> exerciceAdapter;

    Spinner spinnerPrestataire;
    ArrayList<String> prestataireList = new ArrayList<>();
    ArrayAdapter<String> prestataireAdapter;

    Spinner spinnerSite;
    ArrayList<String> siteList = new ArrayList<>();
    ArrayAdapter<String> siteAdapter;

    Spinner spinnerArticle;
    ArrayList<String> articleList = new ArrayList<>();
    ArrayAdapter<String> articleAdapter;

    Spinner spinnerOperation;
    ArrayList<String> operationList = new ArrayList<>();
    ArrayAdapter<String> operationAdapter;

    RequestQueue requestQueue;

    EditText etOrdonnateur, etQte, etObservation;
    Button btn_insert,btn_imprimer;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_manu);

        requestQueue = Volley.newRequestQueue(this);
        spinnerExercice = findViewById(R.id.spinnerExercice);
        spinnerPrestataire = findViewById(R.id.spinnerPrestataire);
        spinnerSite = findViewById(R.id.spinnerSite);
        spinnerArticle = findViewById(R.id.spinnerArticle);
        spinnerOperation = findViewById(R.id.spinnerOperation);
        etOrdonnateur = findViewById(R.id.ordonnateur);
        etQte = findViewById(R.id.qte);
        etObservation = findViewById(R.id.observation);

        btn_insert = findViewById(R.id.btnInsert);
        btn_imprimer=findViewById(R.id.btnImprimer);

        btn_insert.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                inserer();
            }
        });

        btn_imprimer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                    savePdf();
            }
        });


        String url1 = "http://10.0.2.2/manu/populate_exercice.php";
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(Request.Method.POST,
                url1, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                try {
                    JSONArray jsonArray = response.getJSONArray("exercice");
                    for(int i=0; i<jsonArray.length();i++){
                        JSONObject jsonObject = jsonArray.getJSONObject(i);
                        String nm_exercice = jsonObject.optString("nm_exercice");
                        exerciceList.add(nm_exercice);
                        exerciceAdapter = new ArrayAdapter<>(Add_manu.this,
                                android.R.layout.simple_spinner_item, exerciceList);
                        exerciceAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                        spinnerExercice.setAdapter(exerciceAdapter);

                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        });
        requestQueue.add(jsonObjectRequest);

        String url2 = "http://10.0.2.2/manu/populate_prestataire.php";
        JsonObjectRequest jsonObjectRequest2 = new JsonObjectRequest(Request.Method.POST,
                url2, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                try {
                    JSONArray jsonArray = response.getJSONArray("prestataire");
                    for(int i=0; i<jsonArray.length();i++){
                        JSONObject jsonObject = jsonArray.getJSONObject(i);
                        String nm_prestataire = jsonObject.optString("nm_prestataire");
                        prestataireList.add(nm_prestataire);
                        prestataireAdapter = new ArrayAdapter<>(Add_manu.this,
                                android.R.layout.simple_spinner_item, prestataireList);
                        prestataireAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                        spinnerPrestataire.setAdapter(prestataireAdapter);

                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        });
        requestQueue.add(jsonObjectRequest2);



        String url3 = "http://10.0.2.2/manu/populate_site.php";
        JsonObjectRequest jsonObjectRequest3 = new JsonObjectRequest(Request.Method.POST,
                url3, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                try {
                    JSONArray jsonArray = response.getJSONArray("site");
                    for(int i=0; i<jsonArray.length();i++){
                        JSONObject jsonObject = jsonArray.getJSONObject(i);
                        String nm_site = jsonObject.optString("nm_site");
                        siteList.add(nm_site);
                        siteAdapter = new ArrayAdapter<>(Add_manu.this,
                                android.R.layout.simple_spinner_item, siteList);
                        siteAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                        spinnerSite.setAdapter(siteAdapter);

                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        });
        requestQueue.add(jsonObjectRequest3);



        String url4 = "http://10.0.2.2/manu/populate_article.php";
        JsonObjectRequest jsonObjectRequest4 = new JsonObjectRequest(Request.Method.POST,
                url4, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                try {
                    JSONArray jsonArray = response.getJSONArray("article");
                    for(int i=0; i<jsonArray.length();i++){
                        JSONObject jsonObject = jsonArray.getJSONObject(i);
                        String libelle_article = jsonObject.optString("libelle_article");
                        articleList.add(libelle_article);
                        articleAdapter = new ArrayAdapter<>(Add_manu.this,
                                android.R.layout.simple_spinner_item, articleList);
                        articleAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                        spinnerArticle.setAdapter(articleAdapter);

                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        });
        requestQueue.add(jsonObjectRequest4);




        String url5 = "http://10.0.2.2/manu/populate_operation.php";
        JsonObjectRequest jsonObjectRequest5 = new JsonObjectRequest(Request.Method.POST,
                url5, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                try {
                    JSONArray jsonArray = response.getJSONArray("operation");
                    for(int i=0; i<jsonArray.length();i++){
                        JSONObject jsonObject = jsonArray.getJSONObject(i);
                        String libelle_oper = jsonObject.optString("libelle_oper");
                        operationList.add(libelle_oper);
                        operationAdapter = new ArrayAdapter<>(Add_manu.this,
                                android.R.layout.simple_spinner_item, operationList);
                        operationAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                        spinnerOperation.setAdapter(operationAdapter);

                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        });
        requestQueue.add(jsonObjectRequest5);
    }







    private void inserer() {

        final String ordonnateur = etOrdonnateur.getText().toString().trim();
        String exercice = spinnerExercice.getSelectedItem().toString();
        String prestataire = spinnerPrestataire.getSelectedItem().toString();
        String site = spinnerSite.getSelectedItem().toString();
        String article = spinnerArticle.getSelectedItem().toString();
        String operation = spinnerOperation.getSelectedItem().toString();
        final String qte = etQte.getText().toString().trim();
        final String observation = etObservation.getText().toString().trim();

        final ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Enregistrement...");

        if(ordonnateur.isEmpty()){
            Toast.makeText(this, "Entrez le nom de l'ordonnateur", Toast.LENGTH_SHORT).show();
            return;
        }
        else if(qte.isEmpty()){
            Toast.makeText(this, "Entrez la quantité", Toast.LENGTH_SHORT).show();
            return;
        }

        else{
            progressDialog.show();
            StringRequest request = new StringRequest(Request.Method.POST, "http://10.0.2.2/manu/insert.php",
                    new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {

                            if(response.equalsIgnoreCase("Enregistré")){
                                AlertDialog.Builder builder = new AlertDialog.Builder(Add_manu.this);
                                builder.setTitle("Succès").setMessage("Manutention enregistrée").create().show();
                                progressDialog.dismiss();
                                etOrdonnateur.setText("");
                                etQte.setText("");
                                etObservation.setText("");
                            }
                            else{
                                Toast.makeText(Add_manu.this, response, Toast.LENGTH_SHORT).show();
                                progressDialog.dismiss();
                            }

                        }
                    }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                    Toast.makeText(Add_manu.this, error.getMessage(), Toast.LENGTH_SHORT).show();
                    progressDialog.dismiss();
                }
            }

            ){
                @Override
                protected Map<String, String> getParams() throws AuthFailureError {

                    Map<String,String> params = new HashMap<String,String>();

                    params.put("ordonnateur",ordonnateur);
                    params.put("exercice",exercice);
                    params.put("prestataire",prestataire);
                    params.put("site",site);
                    params.put("article",article);
                    params.put("operation",operation);
                    params.put("qte",qte);
                    params.put("observation",observation);

                    return params;
                }
            };


            RequestQueue requestQueue = Volley.newRequestQueue(Add_manu.this);
            requestQueue.add(request);

        }
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        finish();
    }





    private void savePdf() {
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        Bitmap bitmap = BitmapFactory.decodeResource(this.getResources(), R.drawable.logo_sdcc);
        bitmap.compress(Bitmap.CompressFormat.JPEG , 100, stream);
        Image img;
        //String img = "C:/Users/Yassine/Documents/Projets Android/ManuMobile/app/src/main/res/drawable-v24/logo_manu.png";
        //create object of Document class
        Document mDoc = new Document(PageSize.A4_LANDSCAPE);
        //pdf file name
        String date = new SimpleDateFormat("dd-MM-yyyy_HHmm",
                Locale.getDefault()).format(System.currentTimeMillis());
        String mFileName ="Fiche manutention " + date;
        //pdf file path
        String mFilePath = Environment.getExternalStorageDirectory() + "/" + mFileName + ".pdf";

        try {
            //create instance of PdfWriter class
            PdfWriter.getInstance(mDoc, new FileOutputStream(mFilePath));
            //open the document for writing
            mDoc.open();
            //get text from EditText i.e. mTextEt
            String iOrdonnateur = etOrdonnateur.getText().toString();
            String iExercice = spinnerExercice.getSelectedItem().toString();
            String iSite = spinnerSite.getSelectedItem().toString();
            String iArticle = spinnerArticle.getSelectedItem().toString();
            String iOperation = spinnerOperation.getSelectedItem().toString();
            String iQte = etQte.getText().toString();
            String iObservation = etObservation.getText().toString();


            //add paragraph to the document
            img = Image.getInstance(stream.toByteArray());
            mDoc.add(img);

            mDoc.add(new Paragraph("Ordonnateur: " + iOrdonnateur));
            mDoc.add(new Paragraph("Exercice: " + iExercice));
            mDoc.add(new Paragraph("Site: " + iSite));
            mDoc.add(new Paragraph("Arcticle: " + iArticle));
            mDoc.add(new Paragraph("Operation: " + iOperation));
            mDoc.add(new Paragraph("Quantité: " + iQte));
            mDoc.add(new Paragraph("Observation: " + iOperation));
            mDoc.add(new Paragraph("Quantité réelle executée:_______________"));


            //close the document
            mDoc.close();
            //show message that file is saved, it will show file name and file path too
            Toast.makeText(this, mFileName +".pdf \n est enregistré dans "+ mFilePath, Toast.LENGTH_LONG).show();
            etOrdonnateur.setText("");
            etQte.setText("");
            etObservation.setText("");
        }
        catch (Exception e){
            //if any thing goes wrong causing exception, get and show exception message
            Toast.makeText(this, e.getMessage(), Toast.LENGTH_SHORT).show();
        }
    }

}
