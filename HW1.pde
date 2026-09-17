// 
StringList countyCodes = new StringList();
Table data;
void setup(){
    size(1000, 600);
    data = loadTable("energy-mix.csv", "header");
    for(TableRow row : data.rows()){
        if(row.getString("year").equals("2026")){
            countyCodes.append(row.getString("code"));
        }
    }
}

void draw(){
    background(200);
    int year1 = 1965;
    int year2 = 2025;
    int graphWidth = width - 40;
    int graphHeight = height -40;
    int graphTop = 100;
    int graphLeftSide = 40;


    int i = 10;
    fill(0);
    for(String code : countyCodes){
        text(code, i,20);
        i+=10;
    }

    if(countyCodes.size()==0) println("true");

    for(int year = 1965; year<2026 ; year+=4){
        float yearXMapped = map(year,year1,year2,graphLeftSide,graphWidth);
        fill(0);
        text(year,yearXMapped,height-40);
    }

        
}