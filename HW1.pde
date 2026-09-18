//
PieChart piechart;
Slider slider;
StringList countryCodes = new StringList();
String[] notCountries = {"OWID_AFR","ATA"};
Table data;
void setup(){
    size(1000, 600);
    data = loadTable("energy-mix.csv", "header");
    for(TableRow row : data.rows()){
        if(row.getString("year").equals("2024") && !Float.isNaN(row.getFloat("coal_twh")) && row.getString("code")!= ""){
            countryCodes.append(row.getString("code"));
        }
    }
}

void draw(){
    background(255);

    slider = new  Slider(100, 300, 400, 1965, 2025);
    slider.display();
    float currentYear = slider.currentYear();
    int year1 = 1965;
    int year2 = 2025;
    int graphWidth = width - 40;
    int graphHeight = height -40;
    int graphTop = 100;
    int graphLeftSide = 40;

    

    int i = 100;
    for(TableRow row : data.rows()){
        String code = row.getString("code");
        float year = row.getFloat("year");
        
        //if(countryCodes.hasValue(code)  && year == 2024){
        if((code.equals("USA") || code.equals("FRA") || code.equals("CHN")) && year == currentYear){
            float otherRenewables = row.getFloat("other_renewables_twh");
            float bioFuels = row.getFloat("biofuels_twh");
            float solar = row.getFloat("solar_twh");
            float wind = row.getFloat("wind_twh");
            float hydro = row.getFloat("hydro_twh");
            float nuclear = row.getFloat("nuclear_twh");
            float gas = row.getFloat("gas_twh");
            float oil = row.getFloat("oil_twh");
            float coal = row.getFloat("coal_twh");
            
            piechart = new PieChart(otherRenewables,bioFuels,solar,wind,hydro,nuclear,gas,oil,coal,i,100,row.getString("code"),false);

            piechart.display();
            i+=100;


        }
    }


      
}


void mousePressed() {
  slider.mousePressed();
}

void mouseDragged() {
  slider.mouseDragged();
}

void mouseReleased() {
  slider.mouseReleased();
}

