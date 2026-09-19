// i made this becasue my look up table which used type of TableRow wasnt working so this is basically just that but for sources only.
class RowOfSources{
    String entity;
    float otherRenewables;
    float bioFuels;
    float solar;
    float wind;
    float hydro;
    float nuclear;
    float gas;
    float oil;
    float coal;
   

    RowOfSources(String entity,float otherRenewables,float bioFuels,float solar,float wind,float hydro,float nuclear,float gas,float oil,float coal){
        this.entity = entity;
        this.otherRenewables = Float.isNaN(otherRenewables) ? 0.0 : otherRenewables;
        this.bioFuels = Float.isNaN(bioFuels) ? 0.0 :bioFuels;
        this.solar = Float.isNaN(solar) ? 0.0 :solar;
        this.wind = Float.isNaN(wind) ? 0.0 :wind;
        this.hydro = Float.isNaN(hydro) ? 0.0 :hydro;
        this.nuclear = Float.isNaN(nuclear) ? 0.0 :nuclear;
        this.gas = Float.isNaN(gas) ? 0.0 :gas;
        this.oil = Float.isNaN(oil) ? 0.0 :oil;
        this.coal = Float.isNaN(coal) ? 0.0 :coal;
    }
}