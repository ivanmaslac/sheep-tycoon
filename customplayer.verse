using { /Fortnite.com/Characters }
using { /Fortnite.com/Devices }
using { /Fortnite.com/FortPlayerUtilities }
using { /Fortnite.com/UI }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath}
using { /UnrealEngine.com/Temporary/UI }
using { /Verse.org/Simulation }
using { /Verse.org/Simulation/Tags } 

CustomPlayer := class():
    PlayerAgent : agent
    PlayerFort : fort_character

    var PlotNumber : int = 0

    var PlayerResources : Resources = Resources{}
    var PlayerRPS : ResourcesPerSecond = ResourcesPerSecond{}
    
    var WoolScoreText : text_block = text_block{}
    var MagicWoolScoreText : text_block = text_block{}
    var MoneyScoreText : text_block = text_block{}

    GetCustomAgent():agent=
        return PlayerAgent

    GetCustomFort():fort_character=
        return PlayerFort

    InitPlayer():void=
        Print("Player Initialised")
    
    GetMoney()<transacts>:int=
        return PlayerResources.Money

    GetWool()<transacts>:int=
        return PlayerResources.Wool

    GetMagicWool()<transacts>:int=
        return PlayerResources.MagicWool
    
    AddWool(NewWool:int):void=
        set PlayerResources = Resources{Wool := PlayerResources.Wool + NewWool,
        MagicWool:= PlayerResources.MagicWool,
        Money := PlayerResources.Money}
        #Print("Wool: {NewWool}")

    RemoveWool(NewWool:int):void=
        set PlayerResources = Resources{Wool := PlayerResources.Wool - NewWool,
        MagicWool:= PlayerResources.MagicWool,
        Money := PlayerResources.Money}
        #Print("Wool: {NewWool}")

    AddMagicWool(NewMagicWool:int):void=
        set PlayerResources = Resources{Wool := PlayerResources.Wool,
        MagicWool:= PlayerResources.MagicWool + NewMagicWool,
        Money := PlayerResources.Money}

    RemoveMagicWool(NewWool:int):void=
        set PlayerResources = Resources{Wool := PlayerResources.Wool,
        MagicWool:= PlayerResources.MagicWool - NewWool,
        Money := PlayerResources.Money}
        #Print("Wool: {NewWool}")

    AddMoney(NewMoney:int):void=
        set PlayerResources = Resources{Wool := PlayerResources.Wool,
        MagicWool:= PlayerResources.MagicWool,
        Money := PlayerResources.Money + NewMoney}

    AddMPS(NewMoney:int):void=
        set PlayerRPS = ResourcesPerSecond{Wool := PlayerRPS.Wool,
        MagicWool:= PlayerRPS.MagicWool,
        Money := PlayerRPS.Money + NewMoney}
        #Print("Wool Per Second ADDED: {PlayerRPS.Wool}")

    GetMPS()<transacts>:int=
        return PlayerRPS.Money

    RemoveMoney(NewMoney:int):void=
        set PlayerResources = Resources{Wool := PlayerResources.Wool,
        MagicWool:= PlayerResources.MagicWool,
        Money := PlayerResources.Money - NewMoney}

    GetWPS()<transacts>:int=
        return PlayerRPS.Wool

    AddWPS(NewWool:int):void=
        set PlayerRPS = ResourcesPerSecond{Wool := PlayerRPS.Wool + NewWool,
        MagicWool:= PlayerRPS.MagicWool,
        Money := PlayerRPS.Money}
        #Print("Wool Per Second ADDED: {PlayerRPS.Wool}")

    GetMWPS()<transacts>:int=
        return PlayerRPS.MagicWool

    AddMWPS(NewMagicWool:int):void=
        set PlayerRPS = ResourcesPerSecond{Wool := PlayerRPS.Wool,
        MagicWool:= PlayerRPS.MagicWool + NewMagicWool,
        Money := PlayerRPS.Money}

    GetRPS()<transacts>:ResourcesPerSecond=
        return PlayerRPS

    SetPlotNumber(NewPlotNumber : int):void=
        set PlotNumber = NewPlotNumber

    
    GetPlotNumber()<transacts>:int=
        return PlotNumber
    


Resources := struct:
    Wool : int = 0
    MagicWool: int = 0
    Money : int = 0

ResourcesPerSecond := struct:
    Wool : int = 0
    MagicWool: int = 0
    Money : int = 0