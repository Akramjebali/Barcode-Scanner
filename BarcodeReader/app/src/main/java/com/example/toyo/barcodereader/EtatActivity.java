package com.example.toyo.barcodereader;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.TextView;

/**
 * Created by AKRAM on 3/30/2016.
 */
public class EtatActivity   extends Activity{


    String etat;
    private RelativeLayout mealLayout;
    private TextView formatetat;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_etat);
        mealLayout = (RelativeLayout) findViewById(R.id.layout);
        formatetat = (TextView)findViewById(R.id.etat);

        Intent iin= getIntent();
        Bundle b = iin.getExtras();
        if(b!=null)
        {
            etat =(String) b.get("etat");

        }

        if(etat.equals("Autorise"))
        {
            mealLayout.setBackgroundColor(Color.GREEN);
            formatetat.setText("Autorisé");

        }else if(etat.equals("Bloque"))
        {

            mealLayout.setBackgroundColor(Color.RED);
            formatetat.setText("Bloqué");
        }


    }
}
