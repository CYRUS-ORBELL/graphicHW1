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

        if(useCategories){
            noStroke();
            float start = 0 ;
            //renewables
            fill(10,101,40);
            float end = (TWO_PI * (renewables) / total);
            arc(x,y,100,100,start,end,PIE);

            //nuclear
            fill(255,255,0);
            start = end;
            end = start + (TWO_PI * (nuclear)) / total;
            arc(x,y,100,100,start,end,PIE);

            //COG
            fill(74, 65, 42);
            start = end;
            end = start + (TWO_PI * (fossil)) / total;
            arc(x,y,100,100,start,end,PIE);


            fill(0);
            text(name,x-10,y+60);

        }else{
            noStroke();
            float start = 0 ;
            
            fill(140,10,40);
            float end = (TWO_PI * (otherRenewables) / total);
            arc(x,y,100,100,start,end,PIE);

            fill(0,100,0);
            start = end;
            end = start + (TWO_PI * (bioFuels)) / total;
            arc(x,y,100,100,start,end,PIE);


            fill(255,255,0);
            start = end;
            end = start + (TWO_PI * (solar)) / total;
            arc(x,y,100,100,start,end,PIE);

            fill(255);
            start = end;
            end = start + (TWO_PI * (wind)) / total;
            arc(x,y,100,100,start,end,PIE);

            fill(0,0,255);
            start = end;
            end = start + (TWO_PI * (hydro)) / total;
            arc(x,y,100,100,start,end,PIE);
      
            fill(255,255,0);
            start = end;
            end = start + (TWO_PI * (nuclear)) / total;
            arc(x,y,100,100,start,end,PIE);

            fill(200,255,100);
            start = end;
            end = start + (TWO_PI * (gas)) / total;
            arc(x,y,100,100,start,end,PIE);

            
            fill(74, 65, 42);
            start = end;
            end = start + (TWO_PI * (oil)) / total;
            arc(x,y,100,100,start,end,PIE);

            

            fill(0);
            start = end;
            end = start + (TWO_PI * (coal)) / total;
            arc(x,y,100,100,start,end,PIE);

            text(name,x-10,y+60);

        }
        

        
    }


}

