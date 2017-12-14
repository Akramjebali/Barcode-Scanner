package com.example.toyo.barcodereader;


import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;


public class LoginActivity extends Activity implements OnClickListener {


    Button btnlogin,btninscription;
    String login,pwd;
    EditText edit_login,edit_pwd;
    InputStream is=null;
    String result=null;
    String line=null;
    String name=null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        btnlogin = (Button) findViewById(R.id.btnLogin);
        edit_login=(EditText) findViewById(R.id.email);
        edit_pwd=(EditText) findViewById(R.id.password);
        btnlogin.setOnClickListener(this);

        if (android.os.Build.VERSION.SDK_INT > 9) {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);
        }

    }


    @Override
    public void onClick(View v) {
        // TODO Auto-generated method stub

        if(v.getId()==R.id.btnLogin){


            login=edit_login.getText().toString();
            pwd=edit_pwd.getText().toString();

            if(login.equals("")  || pwd.equals(""))
            {
                Toast.makeText(getApplicationContext(), "Veuillez vérifier votre nom d'utilisateur/mot de passe.",
                        Toast.LENGTH_LONG).show();
            }else
            {
                connexion(login, pwd);
            }

        }

    }
    private void connexion(String login,String pwd) {
        // TODO Auto-generated method stub
        ArrayList<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();

        nameValuePairs.add(new BasicNameValuePair("login",login));
        nameValuePairs.add(new BasicNameValuePair("pwd",pwd));
        try
        {
            HttpClient httpclient = new DefaultHttpClient();
            HttpPost httppost = new HttpPost("http://192.168.1.29/scan/login.php");
            httppost.setEntity(new UrlEncodedFormEntity(nameValuePairs));
            HttpResponse response = httpclient.execute(httppost);
            HttpEntity entity = response.getEntity();
            is = entity.getContent();
            Log.e("pass 1", "connection success ");
        }
        catch(Exception e)
        { e.printStackTrace();
            Log.e("Fail 1", e.toString());
            Toast.makeText(getApplicationContext(), "Invalid IP Address",
                    Toast.LENGTH_LONG).show();
        }
        try
        {
            BufferedReader reader = new BufferedReader(new InputStreamReader(is,"iso-8859-1"),8);
            StringBuilder sb = new StringBuilder();
            while ((line = reader.readLine()) != null)
            {
                sb.append(line + "\n");
            }
            is.close();
            result = sb.toString();
            Log.e("pass 2", "connection success ");
        }
        catch(Exception e)
        {
            Log.e("Fail 2", e.toString());
        }
        try
        {

            JSONObject object = new JSONObject(result);

            String name = object.getString("state");
            String id = object.getString("id");
            //textView.setText(name + " - " + verion);
            int chk= Integer.parseInt(name);
            if(chk==1)
            {
                Intent intent = new Intent(this, MainActivity.class);
                intent.putExtra("ID",id);
                startActivity(intent);

            }
            else
            {
                Toast.makeText(getBaseContext(), "Veuillez vérifier votre nom d'utilisateur/mot de passe.",
                        Toast.LENGTH_SHORT).show();
            }


        }
        catch(Exception e)
        {
            Log.e("Fail 3", e.toString());

        }
    }

}
