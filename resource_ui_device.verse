using { /Fortnite.com/Devices }
using { /Fortnite.com/UI }
using { /Verse.org/Simulation }
using { /Verse.org/Colors/NamedColors }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }
using { HUDResources }
 
# A Verse-authored creative device that can be placed in a level
ResourceUIDevice := class(creative_device):
 
    S2M<localizes>(S:string):message="{S}"

    var CPlayers:[]CustomPlayer = array{}

    var PlayersMap:[agent]CustomPlayer = map{}
 
    @editable PlayerSpawners : []player_spawner_device = array{}
    @editable RefreshRate : float = 0.1
    var WoolTextBlockPerAgent : [agent]?text_block = map{}
    var MagicWoolTextBlockPerAgent : [agent]?text_block = map{}
    var MoneyTextBlockPerAgent : [agent]?text_block = map{}
    var MPSTextBlockPerAgent : [agent]?text_block = map{}

    InitPlayer(Agent:agent, CPlayer:CustomPlayer):void=
        PlayerSpawned(Agent, CPlayer)
        option:
            set PlayersMap[Agent] = CPlayer
            
        Print("Player Resource UI Initialised")
 
    PlayerSpawned(Agent:agent, CPlayer:CustomPlayer):void=
        Print("Player Spawned")
        if(WoolTextBlock:=WoolTextBlockPerAgent[Agent]?, MagicWoolTextBlock:=MagicWoolTextBlockPerAgent[Agent]?, MoneyTextBlock:=MoneyTextBlockPerAgent[Agent]?, MPSTextBlock:=MPSTextBlockPerAgent[Agent]?){}
        else:
            AssignUI(Agent, CPlayer)
 
    AssignUI(Agent:agent, CPlayer:CustomPlayer):void=
        Print("Assigning UI")
        MyCanvas:=MakeCanvas(Agent)
        if:
            PlayerUI:=GetPlayerUI[player[Agent]]
        then:
            PlayerUI.AddWidget(MyCanvas)
            spawn{RefreshUI(Agent, CPlayer)}
 
    RefreshUI(Agent:agent, CPlayer:CustomPlayer)<suspends>:void=
        Print("Starting to Refresh UI")
        if(WoolTextBlock := WoolTextBlockPerAgent[Agent]?, MagicWoolTextBlock:=MagicWoolTextBlockPerAgent[Agent]?, MoneyTextBlock:=MoneyTextBlockPerAgent[Agent]?, MPSTextBlock:=MPSTextBlockPerAgent[Agent]?):
            loop:
                Sleep(RefreshRate)
                MyWool := CPlayer.GetWool()
                WoolTextBlock.SetText(S2M("Wool: {MyWool}"))
                MyMagicWool := CPlayer.GetMagicWool()
                MagicWoolTextBlock.SetText(S2M("{MyMagicWool}"))
                MyMoney := CPlayer.GetMoney()
                MoneyTextBlock.SetText(S2M("{MyMoney}"))
                MyMPS := CPlayer.GetMPS()
                MPSTextBlock.SetText(S2M("{MyMPS}"))
 
 
 
    MakeCanvas(Agent:agent):canvas=
        Print("Making Canvas")
        WoolTextBlock:=text_block:
            DefaultTextColor:=White

        MagicWoolTextureBlock:=texture_block:
            DefaultImage:=MagicWoolBar
            DefaultDesiredSize:=vector2{X:=1.0,Y:=1.0}
        MagicWoolTextBlock:=text_block:
            DefaultTextColor:=Magenta
            DefaultJustification:=text_justification.Center
            DefaultShadowColor:=Green
            DefaultShadowOffset:=option{vector2{X:=0.1,Y:=0.1}}


        MoneyTextureBlock:=texture_block:
            DefaultImage:=MoneyBar
            DefaultDesiredSize:=vector2{X:=1.0,Y:=1.0}
        MoneyTextBlock:=text_block:
            DefaultJustification:=text_justification.Center
            DefaultTextColor:=Lime
            DefaultShadowColor:=Green
        MPSTextBlock:=text_block:
            DefaultJustification:=text_justification.Center
            DefaultTextColor:=LightGreen
            DefaultShadowColor:=Green
 
        if(set WoolTextBlockPerAgent[Agent] = option{WoolTextBlock}){}
        if(set MagicWoolTextBlockPerAgent[Agent] = option{MagicWoolTextBlock}){}
        if(set MoneyTextBlockPerAgent[Agent] = option{MoneyTextBlock}){}
        if(set MPSTextBlockPerAgent[Agent] = option{MPSTextBlock}){}
 
        MyCanvas:=canvas:
            Slots:=array:
                canvas_slot:
                    Widget:=MagicWoolTextureBlock
                    Anchors:=anchors{Minimum:=vector2{X:=-0.025,Y:=0.4},Maximum:=vector2{X:=0.175,Y:=0.6}}
                    Offsets:=margin{Left:=0.0,Top:=0.0,Right:=0.0,Bottom:=0.0}
                canvas_slot:
                    Widget:=MagicWoolTextBlock
                    Anchors:=anchors{Minimum:=vector2{X:=0.0,Y:=0.0},Maximum:=vector2{X:=1.0,Y:=1.0}}
                    Offsets:=margin{Left:=-1975.0,Top:=680.0,Right:=0.0,Bottom:=0.0}
                canvas_slot:
                    Widget:=MoneyTextureBlock
                    Anchors:=anchors{Minimum:=vector2{X:=0.4,Y:=0.0},Maximum:=vector2{X:=0.6,Y:=0.2}}
                    Offsets:=margin{Left:=0.0,Top:=0.0,Right:=0.0,Bottom:=0.0}
                canvas_slot:
                    Widget:=MoneyTextBlock
                    Anchors:=anchors{Minimum:=vector2{X:=0.0,Y:=0.0},Maximum:=vector2{X:=1.0,Y:=1.0}}
                    Offsets:=margin{Left:=0.0,Top:=120.0,Right:=0.0,Bottom:=0.0}
                canvas_slot:
                    Widget:=MPSTextBlock
                    Anchors:=anchors{Minimum:=vector2{X:=0.4,Y:=0.0},Maximum:=vector2{X:=0.40001,Y:=1.0}}
                    Offsets:=margin{Left:=0.0,Top:=200.0,Right:=0.0,Bottom:=0.0}
                    SizeToContent:=true
 
        return MyCanvas