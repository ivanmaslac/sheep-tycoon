using { /Fortnite.com/Characters }
using { /Fortnite.com/Devices }
using { /Fortnite.com/FortPlayerUtilities }
using { /Fortnite.com/UI }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath}
using { /UnrealEngine.com/Temporary/UI }
using { /Verse.org/Simulation }
using { /Verse.org/Simulation/Tags } 
using { /UnrealEngine.com/Assets }

using { VFX }

buyable := class():

    var CusPlayer : CustomPlayer

    var MoneyPrice : int = 0
    var MagicPrice : int = 0

    var StartHidden : logic = true

    var BuyablePlotNumber : int = 0

    var WoolPS : int = 0
    var MagicWoolPS : int = 0

    var PurchasedStatus : logic = false

    @editable
    var BuyTrigger:mutator_zone_device = mutator_zone_device{}

    @editable
    var ButtonHider:prop_manipulator_device = prop_manipulator_device{}

    @editable
    var PropShowers:[]prop_manipulator_device = array{}

    @editable
    var SequenceOff:cinematic_sequence_device = cinematic_sequence_device{}
    @editable
    var SequenceOn:cinematic_sequence_device = cinematic_sequence_device{}

    @editable
    var SoundCash:audio_player_device = audio_player_device{}
    @editable
    var SoundError:audio_player_device = audio_player_device{}
    @editable
    var HUDError:hud_message_device = hud_message_device{}

    @editable
    var VFXMoney:vfx_creator_device = vfx_creator_device{}
    
    # array of prerequisite buyables before this one can be bought
    var Prereqs: []buyable = array{}

    # array of unlockable buyables after this one is bought
    var Unlocks: []buyable = array{}

    ShowBuyable()<suspends>:void=
        Print("Showing Buyable")
        SequenceOn.Play()
        ButtonHider.ShowProps()
        Sleep(1.5)
        BuyTrigger.Enable()

    InitBuyable(CPlayer : CustomPlayer):void=
        set CusPlayer = CPlayer
        BuyTrigger.AgentEntersEvent.Subscribe(PurchaseAttempt)
        Print("Buyable Initialised")

    PurchaseAttempt(Agent:agent):void=
        Print("Purchase Attempt")
        if (CusPlayer.GetPlotNumber() = GetBuyablePlotNumber()):
            var Counter : int = 0

            # if the prereqs have both been purchased
            if (Prereqs.Length > 0):
                for (Buyable : Prereqs):
                    if (Buyable.HasBeenPurchased() = true):
                        set Counter += 1
            
            if (Counter = Prereqs.Length):
                if (CusPlayer.GetMoney() < MoneyPrice or CusPlayer.GetMagicWool() < MagicPrice):
                    SoundError.Play(CusPlayer.GetCustomAgent())
                    HUDError.Show(CusPlayer.GetCustomAgent())
                    # show not enough money
                else:
                    set PurchasedStatus = true
                    ButtonHider.HideProps()

                    CusPlayer.RemoveMoney(MoneyPrice)
                    CusPlayer.RemoveMagicWool(MagicPrice)

                    SoundCash.Play(CusPlayer.GetCustomAgent())

                    # Spawn niagara system
                    Transformation : vector3 = CusPlayer.GetCustomFort().GetTransform().Translation
                    MyVFX:cancelable = SpawnParticleSystem(MoneyBurst, Transformation)

                    for (Prop : PropShowers):
                        if (StartHidden = false):
                            Prop.HideProps()
                        else:
                            Prop.ShowProps()

                    for (UnlockedBuyables : Unlocks):
                        spawn:
                            UnlockedBuyables.ShowBuyable()

                    CusPlayer.AddMPS(WoolPS)
                    Print("Player MPS = {CusPlayer.GetMPS()}")
                    CusPlayer.AddMWPS(MagicWoolPS)
                    
                    SequenceOff.Play()
                    BuyTrigger.Disable()

    GetTrigger():mutator_zone_device=
        return BuyTrigger

    SetTrigger(NewTrigger : mutator_zone_device):void=
        set BuyTrigger = NewTrigger

    SetSoundCash(NewSound : audio_player_device):void=
        set SoundCash = NewSound

    SetSoundError(NewSound : audio_player_device):void=
        set SoundError = NewSound

    SetPurchaseVFX(NewVFX : vfx_creator_device):void=
        set VFXMoney = NewVFX

    HasBeenPurchased()<transacts>:logic=
        return PurchasedStatus

    SetPurchaseStatus(Purchased : logic):void=
        set PurchasedStatus = Purchased

    SetPrereqs(NewPrereqs : []buyable):void=
        set Prereqs = NewPrereqs

    SetUnlocks(NewUnlocks : []buyable):void=
        set Unlocks = NewUnlocks

    GetBuyablePlotNumber()<transacts>:int=
        return BuyablePlotNumber

    SetBuyablePlotNumber(NewPlotNumber : int):void=
        set BuyablePlotNumber = NewPlotNumber

    SetHUDError(NewHUDError : hud_message_device):void=
        set HUDError = NewHUDError