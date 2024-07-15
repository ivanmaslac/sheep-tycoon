using { /Fortnite.com/Characters }
using { /Fortnite.com/Devices }
using { /Fortnite.com/FortPlayerUtilities }
using { /Fortnite.com/UI }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath}
using { /UnrealEngine.com/Temporary/UI }
using { /Verse.org/Simulation }
using { /Verse.org/Simulation/Tags } 

log_plot := class(log_channel){}

plot_device := class(creative_device):

    # Logger for the tycoon channel.
    Logger:log = log{Channel := log_plot}


    var Buyables:[]buyable = array{}

    var ClaimStatus : logic = false

    var PlotNumber : int = 0

    @editable
    CheatCode:mutator_zone_device = mutator_zone_device{}

    @editable
    var SoundCash:audio_player_device = audio_player_device{}
    @editable
    var SoundError:audio_player_device = audio_player_device{}
    @editable
    var HUDError:hud_message_device = hud_message_device{}

    @editable
    var VFXMoney:vfx_creator_device = vfx_creator_device{}

    @editable
    var SequenceInitial:cinematic_sequence_device = cinematic_sequence_device{}

    @editable
    T1Sheep1Trig:mutator_zone_device = mutator_zone_device{}
        @editable
        T1Sheep1OffSequence:cinematic_sequence_device = cinematic_sequence_device{}
        @editable
        T1Sheep1OnSequence:cinematic_sequence_device = cinematic_sequence_device{}
        @editable
        T1Sheep1ButtonHider:prop_manipulator_device = prop_manipulator_device{}
        @editable
        T1Sheep1Props:[]prop_manipulator_device = array{}

        @editable
        T1Sheep2Trig:mutator_zone_device = mutator_zone_device{}
            @editable
            T1Sheep2OffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T1Sheep2OnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T1Sheep2ButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            T1Sheep2Props:[]prop_manipulator_device = array{}

        @editable
        T1Sheep3Trig:mutator_zone_device = mutator_zone_device{}
            @editable
            T1Sheep3OffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T1Sheep3OnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T1Sheep3ButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            T1Sheep3Props:[]prop_manipulator_device = array{}

        @editable
        T1Sheep4Trig:mutator_zone_device = mutator_zone_device{}
            @editable
            T1Sheep4OffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T1Sheep4OnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T1Sheep4ButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            T1Sheep4Props:[]prop_manipulator_device = array{}

    @editable
    T2Sheep1Trig:mutator_zone_device = mutator_zone_device{}
        @editable
        T2Sheep1OffSequence:cinematic_sequence_device = cinematic_sequence_device{}
        @editable
        T2Sheep1OnSequence:cinematic_sequence_device = cinematic_sequence_device{}
        @editable
        T2Sheep1ButtonHider:prop_manipulator_device = prop_manipulator_device{}
        @editable
        T2Sheep1Props:[]prop_manipulator_device = array{}

        @editable
        T2Sheep2Trig:mutator_zone_device = mutator_zone_device{}
            @editable
            T2Sheep2OffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T2Sheep2OnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T2Sheep2ButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            T2Sheep2Props:[]prop_manipulator_device = array{}

        @editable
        T2Sheep3Trig:mutator_zone_device = mutator_zone_device{}
            @editable
            T2Sheep3OffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T2Sheep3OnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T2Sheep3ButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            T2Sheep3Props:[]prop_manipulator_device = array{}

        @editable
        T2Sheep4Trig:mutator_zone_device = mutator_zone_device{}
            @editable
            T2Sheep4OffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T2Sheep4OnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T2Sheep4ButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            T2Sheep4Props:[]prop_manipulator_device = array{}

    @editable
    T3Sheep1Trig:mutator_zone_device = mutator_zone_device{}
        @editable
        T3Sheep1OffSequence:cinematic_sequence_device = cinematic_sequence_device{}
        @editable
        T3Sheep1OnSequence:cinematic_sequence_device = cinematic_sequence_device{}
        @editable
        T3Sheep1ButtonHider:prop_manipulator_device = prop_manipulator_device{}
        @editable
        T3Sheep1Props:[]prop_manipulator_device = array{}
    
        @editable
        T3Sheep2Trig:mutator_zone_device = mutator_zone_device{}
            @editable
            T3Sheep2OffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T3Sheep2OnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T3Sheep2ButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            T3Sheep2Props:[]prop_manipulator_device = array{}
    
        @editable
        T3Sheep3Trig:mutator_zone_device = mutator_zone_device{}
            @editable
            T3Sheep3OffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T3Sheep3OnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T3Sheep3ButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            T3Sheep3Props:[]prop_manipulator_device = array{}
    
        @editable
        T3Sheep4Trig:mutator_zone_device = mutator_zone_device{}
            @editable
            T3Sheep4OffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T3Sheep4OnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T3Sheep4ButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            T3Sheep4Props:[]prop_manipulator_device = array{}

    @editable
    T4Sheep1Trig:mutator_zone_device = mutator_zone_device{}
        @editable
        T4Sheep1OffSequence:cinematic_sequence_device = cinematic_sequence_device{}
        @editable
        T4Sheep1OnSequence:cinematic_sequence_device = cinematic_sequence_device{}
        @editable
        T4Sheep1ButtonHider:prop_manipulator_device = prop_manipulator_device{}
        @editable
        T4Sheep1Props:[]prop_manipulator_device = array{}
    
        @editable
        T4Sheep2Trig:mutator_zone_device = mutator_zone_device{}
            @editable
            T4Sheep2OffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T4Sheep2OnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T4Sheep2ButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            T4Sheep2Props:[]prop_manipulator_device = array{}
    
        @editable
        T4Sheep3Trig:mutator_zone_device = mutator_zone_device{}
            @editable
            T4Sheep3OffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T4Sheep3OnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T4Sheep3ButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            T4Sheep3Props:[]prop_manipulator_device = array{}
    
        @editable
        T4Sheep4Trig:mutator_zone_device = mutator_zone_device{}
            @editable
            T4Sheep4OffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T4Sheep4OnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            T4Sheep4ButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            T4Sheep4Props:[]prop_manipulator_device = array{}

    @editable
    CaveBuyTrig:mutator_zone_device = mutator_zone_device{}
        @editable
        CaveBuyOffSequence:cinematic_sequence_device = cinematic_sequence_device{}
        @editable
        CaveBuyOnSequence:cinematic_sequence_device = cinematic_sequence_device{}
        @editable
        CaveBuyButtonHider:prop_manipulator_device = prop_manipulator_device{}
        @editable
        CaveBuyProps:[]prop_manipulator_device = array{}

        @editable
        SheepCopperBuyTrig:mutator_zone_device = mutator_zone_device{}
            @editable
            SheepCopperBuyOffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            SheepCopperBuyOnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            SheepCopperBuyButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            SheepCopperBuyProps:[]prop_manipulator_device = array{}

        @editable
        SheepSilverBuyTrig:mutator_zone_device = mutator_zone_device{}
            @editable
            SheepSilverBuyOffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            SheepSilverBuyOnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            SheepSilverBuyButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            SheepSilverBuyProps:[]prop_manipulator_device = array{}

        @editable
        SheepGoldBuyTrig:mutator_zone_device = mutator_zone_device{}
            @editable
            SheepGoldBuyOffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            SheepGoldBuyOnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            SheepGoldBuyButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            SheepGoldBuyProps:[]prop_manipulator_device = array{}

        @editable
        SheepObsidianBuyTrig:mutator_zone_device = mutator_zone_device{}
            @editable
            SheepObsidianBuyOffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            SheepObsidianBuyOnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            SheepObsidianBuyButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            SheepObsidianBuyProps:[]prop_manipulator_device = array{}

        @editable
        SheepEmeraldBuyTrig:mutator_zone_device = mutator_zone_device{}
            @editable
            SheepEmeraldBuyOffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            SheepEmeraldBuyOnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            SheepEmeraldBuyButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            SheepEmeraldBuyProps:[]prop_manipulator_device = array{}

        @editable
        SheepDiamondBuyTrig:mutator_zone_device = mutator_zone_device{}
            @editable
            SheepDiamondBuyOffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            SheepDiamondBuyOnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            SheepDiamondBuyButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            SheepDiamondBuyProps:[]prop_manipulator_device = array{}

    @editable
    LabBuyTrig:mutator_zone_device = mutator_zone_device{}
        @editable
        LabBuyOffSequence:cinematic_sequence_device = cinematic_sequence_device{}
        @editable
        LabBuyOnSequence:cinematic_sequence_device = cinematic_sequence_device{}
        @editable
        LabBuyButtonHider:prop_manipulator_device = prop_manipulator_device{}
        @editable
        LabBuyProps:[]prop_manipulator_device = array{}
    
        @editable
        LabSheepSpeedBuyTrig:mutator_zone_device = mutator_zone_device{}
            @editable
            LabSheepSpeedBuyOffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            LabSheepSpeedBuyOnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            LabSheepSpeedBuyButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            LabSheepSpeedBuyProps:[]prop_manipulator_device = array{}
    
        @editable
        LabSheepHealthBuyTrig:mutator_zone_device = mutator_zone_device{}
            @editable
            LabSheepHealthBuyOffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            LabSheepHealthBuyOnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            LabSheepHealthBuyButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            LabSheepHealthBuyProps:[]prop_manipulator_device = array{}
    
        @editable
        LabSheepRegenBuyTrig:mutator_zone_device = mutator_zone_device{}
            @editable
            LabSheepRegenBuyOffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            LabSheepRegenBuyOnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            LabSheepRegenBuyButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            LabSheepRegenBuyProps:[]prop_manipulator_device = array{}
    
        @editable
        LabSheepJumpBuyTrig:mutator_zone_device = mutator_zone_device{}
            @editable
            LabSheepJumpBuyOffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            LabSheepJumpBuyOnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            LabSheepJumpBuyButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            LabSheepJumpBuyProps:[]prop_manipulator_device = array{}
    
        @editable
        LabSheepGodBuyTrig:mutator_zone_device = mutator_zone_device{}
            @editable
            LabSheepGodBuyOffSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            LabSheepGodBuyOnSequence:cinematic_sequence_device = cinematic_sequence_device{}
            @editable
            LabSheepGodBuyButtonHider:prop_manipulator_device = prop_manipulator_device{}
            @editable
            LabSheepGodBuyProps:[]prop_manipulator_device = array{}

    OnBegin<override>()<suspends>:void=
        SequenceInitial.Play()
        Print("")

    InitPlot(Agent:agent, CPlayer:CustomPlayer, NewPlotNumber:int):void=
        set PlotNumber = NewPlotNumber
        #Print("Buyables length: {Buyables.Length}")

        # 15 minutes -> All T3 sheep and Gold sheep


        CheatCodeBuyable : buyable = buyable {BuyTrigger := CheatCode, MoneyPrice := 0, CusPlayer := CPlayer, WoolPS := 100000}

        # total = 50
        T1Sheep1 : buyable = buyable {BuyTrigger := T1Sheep1Trig, MoneyPrice := 0, CusPlayer := CPlayer, WoolPS := 5, SequenceOff := T1Sheep1OffSequence, SequenceOn := T1Sheep1OnSequence, ButtonHider := T1Sheep1ButtonHider, PropShowers := T1Sheep1Props}
        T1Sheep2 : buyable = buyable {BuyTrigger := T1Sheep2Trig, MoneyPrice := 200, CusPlayer := CPlayer, WoolPS := 10, SequenceOff := T1Sheep2OffSequence, SequenceOn := T1Sheep2OnSequence, ButtonHider := T1Sheep2ButtonHider, PropShowers := T1Sheep2Props}
        T1Sheep3 : buyable = buyable {BuyTrigger := T1Sheep3Trig, MoneyPrice := 750, CusPlayer := CPlayer, WoolPS := 15, SequenceOff := T1Sheep3OffSequence, SequenceOn := T1Sheep3OnSequence, ButtonHider := T1Sheep3ButtonHider, PropShowers := T1Sheep3Props}
        T1Sheep4 : buyable = buyable {BuyTrigger := T1Sheep4Trig, MoneyPrice := 1500, CusPlayer := CPlayer, WoolPS := 20, SequenceOff := T1Sheep4OffSequence, SequenceOn := T1Sheep4OnSequence, ButtonHider := T1Sheep4ButtonHider, PropShowers := T1Sheep4Props}       
        set Buyables += array{T1Sheep1, T1Sheep2, T1Sheep3, T1Sheep4}

        # total = 115 -> 165
        T2Sheep1 : buyable = buyable {BuyTrigger := T2Sheep1Trig, MoneyPrice := 2000, CusPlayer := CPlayer, WoolPS := 20, SequenceOff := T2Sheep1OffSequence, SequenceOn := T2Sheep1OnSequence, ButtonHider := T2Sheep1ButtonHider, PropShowers := T2Sheep1Props}
        T2Sheep2 : buyable = buyable {BuyTrigger := T2Sheep2Trig, MoneyPrice := 3500, CusPlayer := CPlayer, WoolPS := 25, SequenceOff := T2Sheep2OffSequence, SequenceOn := T2Sheep2OnSequence, ButtonHider := T2Sheep2ButtonHider, PropShowers := T2Sheep2Props}
        T2Sheep3 : buyable = buyable {BuyTrigger := T2Sheep3Trig, MoneyPrice := 6000, CusPlayer := CPlayer, WoolPS := 30, SequenceOff := T2Sheep3OffSequence, SequenceOn := T2Sheep3OnSequence, ButtonHider := T2Sheep3ButtonHider, PropShowers := T2Sheep3Props}
        T2Sheep4 : buyable = buyable {BuyTrigger := T2Sheep4Trig, MoneyPrice := 12000, CusPlayer := CPlayer, WoolPS := 40, SequenceOff := T2Sheep4OffSequence, SequenceOn := T2Sheep4OnSequence, ButtonHider := T2Sheep4ButtonHider, PropShowers := T2Sheep4Props}       
        set Buyables += array{T2Sheep1, T2Sheep2, T2Sheep3, T2Sheep4}

        # total = 260 -> 425
        T3Sheep1 : buyable = buyable {BuyTrigger := T3Sheep1Trig, MoneyPrice := 10000, CusPlayer := CPlayer, WoolPS := 50, SequenceOff := T3Sheep1OffSequence, SequenceOn := T3Sheep1OnSequence, ButtonHider := T3Sheep1ButtonHider, PropShowers := T3Sheep1Props}
        T3Sheep2 : buyable = buyable {BuyTrigger := T3Sheep2Trig, MoneyPrice := 15000, CusPlayer := CPlayer, WoolPS := 60, SequenceOff := T3Sheep2OffSequence, SequenceOn := T3Sheep2OnSequence, ButtonHider := T3Sheep2ButtonHider, PropShowers := T3Sheep2Props}
        T3Sheep3 : buyable = buyable {BuyTrigger := T3Sheep3Trig, MoneyPrice := 22500, CusPlayer := CPlayer, WoolPS := 70, SequenceOff := T3Sheep3OffSequence, SequenceOn := T3Sheep3OnSequence, ButtonHider := T3Sheep3ButtonHider, PropShowers := T3Sheep3Props}
        T3Sheep4 : buyable = buyable {BuyTrigger := T3Sheep4Trig, MoneyPrice := 35000, CusPlayer := CPlayer, WoolPS := 80, SequenceOff := T3Sheep4OffSequence, SequenceOn := T3Sheep4OnSequence, ButtonHider := T3Sheep4ButtonHider, PropShowers := T3Sheep4Props}       
        set Buyables += array{T3Sheep1, T3Sheep2, T3Sheep3, T3Sheep4}

        # total = 260 -> 425
        T4Sheep1 : buyable = buyable {BuyTrigger := T4Sheep1Trig, MoneyPrice := 50000, CusPlayer := CPlayer, WoolPS := 100, SequenceOff := T4Sheep1OffSequence, SequenceOn := T4Sheep1OnSequence, ButtonHider := T4Sheep1ButtonHider, PropShowers := T4Sheep1Props}
        T4Sheep2 : buyable = buyable {BuyTrigger := T4Sheep2Trig, MoneyPrice := 75000, CusPlayer := CPlayer, WoolPS := 120, SequenceOff := T4Sheep2OffSequence, SequenceOn := T4Sheep2OnSequence, ButtonHider := T4Sheep2ButtonHider, PropShowers := T4Sheep2Props}
        T4Sheep3 : buyable = buyable {BuyTrigger := T4Sheep3Trig, MoneyPrice := 125000, CusPlayer := CPlayer, WoolPS := 140, SequenceOff := T4Sheep3OffSequence, SequenceOn := T4Sheep3OnSequence, ButtonHider := T4Sheep3ButtonHider, PropShowers := T4Sheep3Props}
        T4Sheep4 : buyable = buyable {BuyTrigger := T4Sheep4Trig, MoneyPrice := 200000, CusPlayer := CPlayer, WoolPS := 160, SequenceOff := T4Sheep4OffSequence, SequenceOn := T4Sheep4OnSequence, ButtonHider := T4Sheep4ButtonHider, PropShowers := T4Sheep4Props}       
        set Buyables += array{T4Sheep1, T4Sheep2, T4Sheep3, T4Sheep4}

        Cave : buyable = buyable {StartHidden := false, BuyTrigger := CaveBuyTrig, MoneyPrice := 500, CusPlayer := CPlayer, WoolPS := 0, SequenceOff := CaveBuyOffSequence, SequenceOn := CaveBuyOnSequence, ButtonHider := CaveBuyButtonHider, PropShowers := CaveBuyProps}
        SheepCopper : buyable = buyable {BuyTrigger := SheepCopperBuyTrig, MoneyPrice := 2500, CusPlayer := CPlayer, WoolPS := 5, SequenceOff := SheepCopperBuyOffSequence, SequenceOn := SheepCopperBuyOnSequence, ButtonHider := SheepCopperBuyButtonHider, PropShowers := SheepCopperBuyProps}       
        SheepSilver : buyable = buyable {BuyTrigger := SheepSilverBuyTrig, MoneyPrice := 12500, CusPlayer := CPlayer, WoolPS := 25, SequenceOff := SheepSilverBuyOffSequence, SequenceOn := SheepSilverBuyOnSequence, ButtonHider := SheepSilverBuyButtonHider, PropShowers := SheepSilverBuyProps}       
        SheepGold : buyable = buyable {BuyTrigger := SheepGoldBuyTrig, MoneyPrice := 40000, CusPlayer := CPlayer, WoolPS := 80, SequenceOff := SheepGoldBuyOffSequence, SequenceOn := SheepGoldBuyOnSequence, ButtonHider := SheepGoldBuyButtonHider, PropShowers := SheepGoldBuyProps}       
        SheepObsidian : buyable = buyable {BuyTrigger := SheepObsidianBuyTrig, MoneyPrice := 100000, CusPlayer := CPlayer, WoolPS := 100, SequenceOff := SheepObsidianBuyOffSequence, SequenceOn := SheepObsidianBuyOnSequence, ButtonHider := SheepObsidianBuyButtonHider, PropShowers := SheepObsidianBuyProps}       
        SheepEmerald : buyable = buyable {BuyTrigger := SheepEmeraldBuyTrig, MoneyPrice := 250000, CusPlayer := CPlayer, WoolPS := 200, SequenceOff := SheepEmeraldBuyOffSequence, SequenceOn := SheepEmeraldBuyOnSequence, ButtonHider := SheepEmeraldBuyButtonHider, PropShowers := SheepEmeraldBuyProps}       
        SheepDiamond : buyable = buyable {BuyTrigger := SheepDiamondBuyTrig, MoneyPrice := 500000, CusPlayer := CPlayer, WoolPS := 250, SequenceOff := SheepDiamondBuyOffSequence, SequenceOn := SheepDiamondBuyOnSequence, ButtonHider := SheepDiamondBuyButtonHider, PropShowers := SheepDiamondBuyProps}
        set Buyables += array{Cave, SheepCopper, SheepSilver, SheepGold, SheepObsidian, SheepEmerald, SheepDiamond}

        Lab : buyable = buyable {StartHidden := false, BuyTrigger := LabBuyTrig, MoneyPrice := 500, CusPlayer := CPlayer, MagicWoolPS := 1, SequenceOff := LabBuyOffSequence, SequenceOn := LabBuyOnSequence, ButtonHider := LabBuyButtonHider, PropShowers := LabBuyProps}
        LabSheepSpeed : buyable = buyable {BuyTrigger := LabSheepSpeedBuyTrig, MagicPrice := 50, CusPlayer := CPlayer, MagicWoolPS := 4, SequenceOff := LabSheepSpeedBuyOffSequence, SequenceOn := LabSheepSpeedBuyOnSequence, ButtonHider := LabSheepSpeedBuyButtonHider, PropShowers := LabSheepSpeedBuyProps}
        LabSheepHealth : buyable = buyable {BuyTrigger := LabSheepHealthBuyTrig, MagicPrice := 500, CusPlayer := CPlayer, MagicWoolPS := 45, SequenceOff := LabSheepHealthBuyOffSequence, SequenceOn := LabSheepHealthBuyOnSequence, ButtonHider := LabSheepHealthBuyButtonHider, PropShowers := LabSheepHealthBuyProps}
        LabSheepRegen : buyable = buyable {BuyTrigger := LabSheepRegenBuyTrig, MagicPrice := 5000, CusPlayer := CPlayer, MagicWoolPS := 450, SequenceOff := LabSheepRegenBuyOffSequence, SequenceOn := LabSheepRegenBuyOnSequence, ButtonHider := LabSheepRegenBuyButtonHider, PropShowers := LabSheepRegenBuyProps}
        LabSheepJump : buyable = buyable {BuyTrigger := LabSheepJumpBuyTrig, MagicPrice := 50000, CusPlayer := CPlayer, MagicWoolPS := 4500, SequenceOff := LabSheepJumpBuyOffSequence, SequenceOn := LabSheepJumpBuyOnSequence, ButtonHider := LabSheepJumpBuyButtonHider, PropShowers := LabSheepJumpBuyProps}
        LabSheepGod : buyable = buyable {BuyTrigger := LabSheepGodBuyTrig, MoneyPrice := 1000000, MagicPrice := 500000, CusPlayer := CPlayer, MagicWoolPS := 0, SequenceOff := LabSheepGodBuyOffSequence, SequenceOn := LabSheepGodBuyOnSequence, ButtonHider := LabSheepGodBuyButtonHider, PropShowers := LabSheepGodBuyProps}
        set Buyables += array{Lab, LabSheepSpeed, LabSheepHealth, LabSheepRegen, LabSheepJump, LabSheepGod}

        # Print("Buyables length: {Buyables.Length}")
        
        ### PREREQS ###
            SheepCopper.SetPrereqs(array{Cave})
            SheepSilver.SetPrereqs(array{SheepCopper})
            SheepGold.SetPrereqs(array{SheepSilver})
            SheepObsidian.SetPrereqs(array{SheepGold})
            SheepEmerald.SetPrereqs(array{SheepObsidian})
            SheepDiamond.SetPrereqs(array{SheepEmerald})

            Lab.SetPrereqs(array{T2Sheep1})
            LabSheepSpeed.SetPrereqs(array{Lab})
            LabSheepHealth.SetPrereqs(array{LabSheepSpeed})
            LabSheepRegen.SetPrereqs(array{LabSheepHealth})
            LabSheepJump.SetPrereqs(array{LabSheepRegen})
            LabSheepGod.SetPrereqs(array{LabSheepJump})

            T1Sheep2.SetPrereqs(array{T1Sheep1})
            T1Sheep3.SetPrereqs(array{T1Sheep2})
            T1Sheep4.SetPrereqs(array{T1Sheep3})

            T2Sheep1.SetPrereqs(array{T1Sheep1})
            T2Sheep2.SetPrereqs(array{T2Sheep1})
            T2Sheep3.SetPrereqs(array{T2Sheep2})
            T2Sheep4.SetPrereqs(array{T2Sheep3})

            T3Sheep1.SetPrereqs(array{T2Sheep1})
            T3Sheep2.SetPrereqs(array{T3Sheep1})
            T3Sheep3.SetPrereqs(array{T3Sheep2})
            T3Sheep4.SetPrereqs(array{T3Sheep3})

            T4Sheep1.SetPrereqs(array{T3Sheep1})
            T4Sheep2.SetPrereqs(array{T4Sheep1})
            T4Sheep3.SetPrereqs(array{T4Sheep2})
            T4Sheep4.SetPrereqs(array{T4Sheep3})
        ### UNLOCKS ###
            Cave.SetUnlocks(array{SheepCopper})
            SheepCopper.SetUnlocks(array{SheepSilver})
            SheepSilver.SetUnlocks(array{SheepGold})
            SheepGold.SetUnlocks(array{SheepObsidian})
            SheepObsidian.SetUnlocks(array{SheepEmerald})
            SheepEmerald.SetUnlocks(array{SheepDiamond})

            Lab.SetUnlocks(array{LabSheepSpeed})
            LabSheepSpeed.SetUnlocks(array{LabSheepHealth})
            LabSheepHealth.SetUnlocks(array{LabSheepRegen})
            LabSheepRegen.SetUnlocks(array{LabSheepJump})
            LabSheepJump.SetUnlocks(array{LabSheepGod})
            # LabSheepGod.SetUnlocks(array{})

            T1Sheep1.SetUnlocks(array{T2Sheep1, T1Sheep2, Cave})
            T1Sheep2.SetUnlocks(array{T1Sheep3})
            T1Sheep3.SetUnlocks(array{T1Sheep4})
            
            T2Sheep1.SetUnlocks(array{T3Sheep1, T2Sheep2})
            T2Sheep2.SetUnlocks(array{T2Sheep3})
            T2Sheep3.SetUnlocks(array{T2Sheep4})

            T3Sheep1.SetUnlocks(array{T4Sheep1, T3Sheep2})
            T3Sheep2.SetUnlocks(array{T3Sheep3})
            T3Sheep3.SetUnlocks(array{T3Sheep4})

            T4Sheep1.SetUnlocks(array{T4Sheep2})
            T4Sheep2.SetUnlocks(array{T4Sheep3})
            T4Sheep3.SetUnlocks(array{T4Sheep4})
        Print("Buyables Length= {Buyables.Length}")

        for (Buyable : Buyables):
            Buyable.InitBuyable(CPlayer)
            #Do i need this line?
            #Buyable.SetOwner(Owner)
            Buyable.SetSoundCash(SoundCash)
            Buyable.SetSoundError(SoundError)
            Buyable.SetHUDError(HUDError)
            Buyable.SetPurchaseVFX(VFXMoney)

            Buyable.GetTrigger().Disable()
            Buyable.SetBuyablePlotNumber(PlotNumber)


        T1Sheep1.SequenceOn.Play()
        T1Sheep1.BuyTrigger.Enable()
        T1Sheep1.ButtonHider.ShowProps()
        Print("InitPlot completed within PlotDevice")

    HasBeenClaimed()<transacts>:logic=
        return ClaimStatus