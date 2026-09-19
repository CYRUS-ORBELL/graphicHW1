import java.util.HashMap;

boolean pieMode = true;
boolean useCategories = true;
StringList countryCodes = new StringList();
Table data;
String chartStyleText = "Change to Line Graph";
FloatDict countryHighestEnergyLookupTable;
HashMap<String, RowOfSources> countryYearRowLookup;
PFont titleFont;
PFont labelFont;

void setup(){
    size(1000, 600);
    
    labelFont = createFont("SansSerif", 14);

    textFont(labelFont);
    data = loadTable("energy-mix.csv", "header");
    countryHighestEnergyLookupTable = new FloatDict();
    countryYearRowLookup = new HashMap<String, RowOfSources>();

    for(TableRow row : data.rows()){

        String code = row.getString("code");
        String year = row.getString("year");

        // this removes countries with no data for 2024
        if(year != null && year.equals("2024") && !Float.isNaN(row.getFloat("coal_twh")) && code != null && !code.equals("")){
            if(!countryCodes.hasValue(code)){
                countryCodes.append(code);
            }
        }

        if(code != null && !code.equals("")){
            RowOfSources rowofsources = new RowOfSources(row.getFloat("other_renewables_twh"),row.getFloat("biofuels_twh"),
            row.getFloat("solar_twh"),row.getFloat("wind_twh"),row.getFloat("hydro_twh"),
            row.getFloat("nuclear_twh"),row.getFloat("gas_twh"),row.getFloat("oil_twh"), row.getFloat("coal_twh"));
            countryYearRowLookup.put(code + "_" + row.getInt("year"),rowofsources );
        }
        
        
    }

    // finds the highest energy output ever for each country
    for(String code : countryCodes){
        float largest = 0;
        for(TableRow row : data.rows()){
            if(code.equals(row.getString("code"))){
                float total = getTotalEnergy(row);
                if(total > largest) largest = total;
            }
        }
        countryHighestEnergyLookupTable.set(code, largest);
    }
}

    

void draw(){
    background(255);

    int year1 = 1965;
    int year2 = 2024;
    int graphWidth = width - 150;
    int graphBottom = height -100;
    int graphTop = 100;
    int graphLeftSide = 100;
    
    stroke(0);
    line(graphWidth,0,graphWidth,height);
    
    
    fill(0);
    rect(width -140 , 200, 120, 40);
    fill(255);
    text(chartStyleText,width -130 , 200+20);
    noStroke();
    fill(240,100,0);
    rect(width -130 , 250, 100, 40);
    fill(0);
    text("Group Energy Types",width -130 , 250+20);
   

    
    if(pieMode){
        int i = graphLeftSide+100;
        for(TableRow row : data.rows()){
            String code = row.getString("code");
            float year = row.getFloat("year");
            if((code.equals("USA") || code.equals("FRA") || code.equals("CHN")) && year == 2024){
                PieChart piechart = new PieChart(row.getFloat("other_renewables_twh"),row.getFloat("biofuels_twh"),row.getFloat("solar_twh"),row.getFloat("wind_twh"),row.getFloat("hydro_twh"),row.getFloat("nuclear_twh"),row.getFloat("gas_twh"),row.getFloat("oil_twh"), row.getFloat("coal_twh"),i,100,code,useCategories);
                piechart.display();
                i+=110;
            }
        } 
    }else{
        
        StringList countries = new StringList("BRA");
        float highest = getHighestAmount(countries);
        println(highest);
        for(int year = year1; year < year2; year++){
            for(String code : countries){
                RowOfSources row = countryYearRowLookup.get(code + "_" + year);
                
                if(row != null){
                    float mappedX = map(year,1965,2024,graphLeftSide,graphWidth);
                    Bar bar = new Bar(row.otherRenewables,row.bioFuels,row.solar,row.wind,row.hydro,row.nuclear,row.gas,row.oil,row.coal,mappedX,graphBottom,graphTop,highest,code,useCategories);
                    bar.display();
                }
            }
        }

    }     
}

void mousePressed() {
    if (mouseX > width - 130  && mouseX < width-30 && mouseY > 200 && mouseY < 240) {
        pieMode = !pieMode;
        if (chartStyleText.equals("Change to Line Graph")){
            chartStyleText = "Change to Pie Chart";
        }else{
            chartStyleText = "Change to Line Graph";
        }
    }

    if (mouseX > width - 130  && mouseX < width-30 && mouseY > 250 && mouseY < 290) {
        useCategories = !useCategories;
    }
  
}

void mouseDragged() {
 
}

void mouseReleased() {

}


float getTotalEnergy(TableRow row){
    return row.getFloat("other_renewables_twh") +
           row.getFloat("biofuels_twh") +
           row.getFloat("solar_twh") +
           row.getFloat("wind_twh") +
           row.getFloat("hydro_twh") +
           row.getFloat("nuclear_twh") +
           row.getFloat("gas_twh") +
           row.getFloat("oil_twh") +
           row.getFloat("coal_twh");
}

float getHighestAmount(StringList codes){
    float highest = 0;
    for(String code : codes){
        float amount = countryHighestEnergyLookupTable.get(code);
        if(amount > highest) highest = amount;
    }
    return highest;
}