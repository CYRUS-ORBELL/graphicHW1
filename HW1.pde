// 
Table data;
void setup(){
    size(1000, 600);
    data = loadTable("energy-mix.csv", "header");
}

void draw(){
    background(200);
    int year1 = 1965;
    int year2 = 2025;
    int graphWidth = width - 40;
    int graphHeight = height -40;
    int graphTop = 100;
    int graphLeftSide = 40;


    for(int year = 1965; year<2026 ; year+=4){
        float yearXMapped = map(year,year1,year2,graphLeftSide,graphWidth);
        fill(0);
        text(year,yearXMapped,height-40);
    }

        
}