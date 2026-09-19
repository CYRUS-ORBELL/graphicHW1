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
        if(useCategories){
            float graphHeight = graphBottom - graphTop;

            // Fossil fuels
            float sizeOfPart = map(fossil, 0, highest, 0, graphHeight);

            fill(30);
            float startingPoint = graphBottom - sizeOfPart;
            rect(x, startingPoint, 5, sizeOfPart);

            // Nuclear
            sizeOfPart = map(nuclear, 0, highest, 0, graphHeight);

            fill(255, 255, 0);
            startingPoint -= sizeOfPart;
            rect(x, startingPoint, 5, sizeOfPart);

            //Renewables

            sizeOfPart = map(renewables, 0, highest, 0, graphHeight);
            fill(0, 255, 0);
            startingPoint -= sizeOfPart;
            rect(x, startingPoint, 5, sizeOfPart);



            

        }else{
           
        }
    }
}