// i made this becasue my look up table which used type of TableRow wasnt working so this is basically just that but for sources only.
class RowOfSources{
    float otherRenewables;
    float bioFuels;
    float solar;
    float wind;
    float hydro;
    float nuclear;
    float gas;
    float oil;
    float coal;
   

    RowOfSources(float otherRenewables,float bioFuels,float solar,float wind,float hydro,float nuclear,float gas,float oil,float coal){
        this.otherRenewables = otherRenewables;
        this.bioFuels = bioFuels;
        this.solar = solar;
        this.wind = wind;
        this.hydro = hydro;
        this.nuclear = nuclear;
        this.gas = gas;
        this.oil = oil;
        this.coal = coal;
    }
}