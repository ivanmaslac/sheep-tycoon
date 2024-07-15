using { /Fortnite.com/Characters }
using { /Fortnite.com/Devices }
using { /Fortnite.com/FortPlayerUtilities }
using { /Fortnite.com/UI }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath}
using { /UnrealEngine.com/Temporary/UI }
using { /Verse.org/Simulation }
using { /Verse.org/Simulation/Tags } 

log_tycoon := class(log_channel){}

tycoon_device := class(creative_device):
    # Logger for the tycoon channel.
    Logger:log = log{Channel := log_tycoon}

    # Array of plot devices used to manage the tycoon's plots.
    var PlotDevices:[]plot_device = array{}

    # Map container to track player's progress. This is used to determine which weapon to award to the player.
    var PlayersMap<public>:[agent]CustomPlayer = map{}

    var AgentList:[]agent = array{}

    @editable PlayerSpawners : []player_spawner_device = array{}

    @editable
    Plot1:plot_device = plot_device{}
    @editable
    Plot2:plot_device = plot_device{}
    @editable
    Plot3:plot_device = plot_device{}
    @editable
    Plot4:plot_device = plot_device{}

    @editable
    Plot1Trigger:mutator_zone_device = mutator_zone_device{}
    @editable
    Plot2Trigger:mutator_zone_device = mutator_zone_device{}
    @editable
    Plot3Trigger:mutator_zone_device = mutator_zone_device{}
    @editable
    Plot4Trigger:mutator_zone_device = mutator_zone_device{}

    @editable
    ResourceDevice:ResourceUIDevice = ResourceUIDevice{}

    @editable
    ResourceManagerDevice:ResourceManager = ResourceManager{}

    OnBegin<override>()<suspends>:void=
        Plot1Trigger.AgentEntersEvent.Subscribe(OnPlot1Trigger)
        # Plot2Trigger.AgentEntersEvent.Subscribe(OnPlot2Trigger)
        # Plot3Trigger.AgentEntersEvent.Subscribe(OnPlot3Trigger)
        # Plot4Trigger.AgentEntersEvent.Subscribe(OnPlot4Trigger)

        for(PS:PlayerSpawners):
            PS.SpawnedEvent.Subscribe(OnPlayerSpawned)
    
    OnPlayerSpawned(Agent:agent):void=
        if (PlayerExists := PlayersMap[Agent]):
            # Do nothing if player already exists
        else:
            set AgentList += array{Agent}
            if (AgentFort := Agent.GetFortCharacter[]):
                NewCustomPlayer : CustomPlayer = CustomPlayer{PlayerAgent := Agent, PlayerFort := AgentFort}
                if (set PlayersMap[Agent] = NewCustomPlayer):
                    NewCustomPlayer.InitPlayer()
                    Print("Player Spawned Done")

    OnPlot1Trigger(Agent:agent):void=
       # Print("Start of plot1trigger")
        if (Plot1.HasBeenClaimed() = false):
            #Print("Plot not claimed yet")
            for (AgentFound : AgentList):
                #Print("Agentlist")
                if (AgentFound = Agent):
                    #Print("Is agent within agentfound list")
                    if (AgentFoundCPlayer := PlayersMap[AgentFound]):
                        Plot1.InitPlot(AgentFound, AgentFoundCPlayer, 1)
                        AgentFoundCPlayer.SetPlotNumber(1)
                        ResourceDevice.InitPlayer(AgentFound, AgentFoundCPlayer)
                        ResourceManagerDevice.InitPlayer(AgentFound, AgentFoundCPlayer)
                        Plot1Trigger.Disable()
                        Print("Plot1 Initialised")