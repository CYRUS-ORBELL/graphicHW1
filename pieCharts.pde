class PieChart{
    float otherRenewables;
    float bioFuels;
    float solar;
    float wind;
    float hydro;
    float nuclear;
    float gas;
    float oil;
    float coal;

    float total;
    float renewables;
    float fossil;
    boolean useCategories = true;

    String name;

    int x;
    int y;



    PieChart(float otherRenewables,float bioFuels,float solar,float wind,float hydro,float nuclear,float gas,float oil,float coal,int x, int y, String name , boolean useCategories){
        this.otherRenewables = otherRenewables;
        this.bioFuels = bioFuels;
        this.solar = solar;
        this.wind = wind;
        this.hydro = hydro;
        this.nuclear = nuclear;
        this.gas = gas;
        this.oil = oil;
        this.coal = coal;

        fossil = (oil+gas+coal);
        renewables = (otherRenewables+bioFuels+solar+wind+hydro);
        total = (fossil + renewables + nuclear);

        this.x = x;
        this.y = y;
        this.name = name;

        this.useCategories = useCategories;
    }

    void display(){
        
        textSize(10);
        if(total == 0) text("No Data",x,y);

        if(useCategories){
            noStroke();
            float start = 0 ;
            //renewables
            fill(colorMap.get("renewables"));
            float end = (TWO_PI * (renewables) / total);
            arc(x,y,100,100,start,end,PIE);

            //nuclear
            fill(colorMap.get("nuclear"));
            start = end;
            end = start + (TWO_PI * (nuclear)) / total;
            arc(x,y,100,100,start,end,PIE);

            //COG
            fill(colorMap.get("fossils"));
            start = end;
            end = start + (TWO_PI * (fossil)) / total;
            arc(x,y,100,100,start,end,PIE);


            fill(0);
            textAlign(CENTER, CENTER);
            text(name,x,y+55);

        }else{
            noStroke();
            float start = 0 ;
            
            fill(colorMap.get("other renewables"));
            float end = (TWO_PI * (otherRenewables) / total);
            arc(x,y,100,100,start,end,PIE);

            fill(colorMap.get("biofuels"));
            start = end;
            end = start + (TWO_PI * (bioFuels)) / total;
            arc(x,y,100,100,start,end,PIE);


            fill(colorMap.get("solar"));
            start = end;
            end = start + (TWO_PI * (solar)) / total;
            arc(x,y,100,100,start,end,PIE);

            fill(colorMap.get("wind"));
            start = end;
            end = start + (TWO_PI * (wind)) / total;
            arc(x,y,100,100,start,end,PIE);

            fill(colorMap.get("hydro"));
            start = end;
            end = start + (TWO_PI * (hydro)) / total;
            arc(x,y,100,100,start,end,PIE);
      
            fill(colorMap.get("nuclear"));
            start = end;
            end = start + (TWO_PI * (nuclear)) / total;
            arc(x,y,100,100,start,end,PIE);

            fill(colorMap.get("gas"));
            start = end;
            end = start + (TWO_PI * (gas)) / total;
            arc(x,y,100,100,start,end,PIE);

            
            fill(colorMap.get("oil"));
            start = end;
            end = start + (TWO_PI * (oil)) / total;
            arc(x,y,100,100,start,end,PIE);

            

            fill(colorMap.get("coal"));
            start = end;
            end = start + (TWO_PI * (coal)) / total;
            arc(x,y,100,100,start,end,PIE);

            textAlign(CENTER, CENTER);
            text(name,x,y+55);

        }
        

        
    }


}

