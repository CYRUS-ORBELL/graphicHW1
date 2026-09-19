class Bar{
    float otherRenewables;
    float bioFuels;
    float solar;
    float wind;
    float hydro;
    float nuclear;
    float gas;
    float oil;
    float coal;
    
    float graphBottom;
    float graphTop;
    float highest;

    float total;
    float renewables;
    float fossil;
    boolean useCategories = true;

    String name;

    float x;
    float y;

    Bar(float otherRenewables,float bioFuels,float solar,float wind,float hydro,float nuclear,float gas,float oil,float coal,float x,float graphBottom,float graphTop,float highest, String name , boolean useCategories){
        this.otherRenewables = otherRenewables;
        this.bioFuels = bioFuels;
        this.solar = solar;
        this.wind = wind;
        this.hydro = hydro;
        this.nuclear = nuclear;
        this.gas = gas;
        this.oil = oil;
        this.coal = coal;

        this.graphBottom = graphBottom;
        this.graphTop = graphTop;
        this.highest = highest;

        fossil = (oil+gas+coal);
        renewables = (otherRenewables+bioFuels+solar+wind+hydro);
        total = (fossil + renewables + nuclear);

        this.x = x;
       
        this.name = name;

        this.useCategories = useCategories;
    }

    void display(){
        if(total==0){
            return;
        }
        
        if(useCategories){
            float graphHeight = graphBottom - graphTop;

            // Fossil fuels
            float sizeOfPart = map(fossil, 0, highest, 0, graphHeight);

            fill(colorMap.get("fossils"));
            float startingPoint = graphBottom - sizeOfPart;
            rect(x, startingPoint, 5, sizeOfPart);

            // Nuclear
            sizeOfPart = map(nuclear, 0, highest, 0, graphHeight);

            fill(colorMap.get("nuclear"));
            startingPoint -= sizeOfPart;
            rect(x, startingPoint, 5, sizeOfPart);

            //Renewables

            sizeOfPart = map(renewables, 0, highest, 0, graphHeight);
            fill(colorMap.get("renewables"));
            startingPoint -= sizeOfPart;
            rect(x, startingPoint, 5, sizeOfPart);

            

        }else{
            float graphHeight = graphBottom - graphTop;

            
            float sizeOfPart = map(oil, 0, highest, 0, graphHeight);
            fill(colorMap.get("oil"));
            float startingPoint = graphBottom - sizeOfPart;
            rect(x, startingPoint, 5, sizeOfPart);



            sizeOfPart = map(gas, 0, highest, 0, graphHeight);
            fill(colorMap.get("gas"));
            startingPoint -= sizeOfPart;
            rect(x, startingPoint, 5, sizeOfPart);

            sizeOfPart = map(coal, 0, highest, 0, graphHeight);
            fill(colorMap.get("coal"));
            startingPoint -= sizeOfPart;
            rect(x, startingPoint, 5, sizeOfPart);

            sizeOfPart = map(nuclear, 0, highest, 0, graphHeight);
            fill(colorMap.get("nuclear"));
            startingPoint -= sizeOfPart;
            rect(x, startingPoint, 5, sizeOfPart);

            sizeOfPart = map(otherRenewables, 0, highest, 0, graphHeight);
            fill(colorMap.get("other renewables"));
            startingPoint -= sizeOfPart;
            rect(x, startingPoint, 5, sizeOfPart);
            
            sizeOfPart = map(bioFuels, 0, highest, 0, graphHeight);
            fill(colorMap.get("biofuels"));
            startingPoint -= sizeOfPart;
            rect(x, startingPoint, 5, sizeOfPart);

            sizeOfPart = map(solar, 0, highest, 0, graphHeight);
            fill(colorMap.get("solar"));
            startingPoint -= sizeOfPart;
            rect(x, startingPoint, 5, sizeOfPart);

            sizeOfPart = map(wind, 0, highest, 0, graphHeight);
            fill(colorMap.get("wind"));
            startingPoint -= sizeOfPart;
            rect(x, startingPoint, 5, sizeOfPart);

            sizeOfPart = map(hydro, 0, highest, 0, graphHeight);
            fill(colorMap.get("hydro"));
            startingPoint -= sizeOfPart;
            rect(x, startingPoint, 5, sizeOfPart);
            
            
           
        }
        fill(0);
        textAlign(CENTER,TOP);
        text(name.toCharArray()[0],x,graphBottom+2);
    }
}