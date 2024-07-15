using { /Fortnite.com/Devices }
using { /Fortnite.com/UI }
using { /Verse.org/Simulation }
using { /Verse.org/Colors/NamedColors }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }
 
# A Verse-authored creative device that can be placed in a level
ResourceManager := class(creative_device):

    var AgentPlayer:[agent]CustomPlayer = map{}
    var AgentResources:[agent]ResourcesPerSecond = map{}

    @editable
    SellMutator:mutator_zone_device = mutator_zone_device{}

    @editable RefreshRate : float = 1.0

    OnBegin<override>()<suspends>:void=
        SellMutator.AgentEntersEvent.Subscribe(AgentSellAttempt)

    AgentSellAttempt(Agent:agent):void=
        if (AgentCustom := AgentPlayer[Agent]):
            Wool := AgentCustom.GetWool()
            AgentCustom.AddMoney(Wool)
            AgentCustom.RemoveWool(Wool)


    InitPlayer(Agent:agent, CPlayer:CustomPlayer):void=
        if (PlayerExists := AgentPlayer[Agent]):
            # Do nothing if player already exists
        else:
            if (set AgentPlayer[Agent] = CPlayer):
                if (set AgentResources[Agent] = CPlayer.GetRPS()):
                    spawn:
                        RefreshResources(Agent, CPlayer)
                    Print("Player Resource Manager Initialised")

    RefreshResources(Agent:agent, CPlayer:CustomPlayer)<suspends>:void=
        Print("Starting to Refresh Resources")
        loop:
            Sleep(RefreshRate)
            MWPS := CPlayer.GetMWPS()
            MPS := CPlayer.GetMPS()
            
            CPlayer.AddMagicWool(MWPS)
            CPlayer.AddMoney(MPS)