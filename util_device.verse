using { /Fortnite.com/Characters }
using { /Fortnite.com/Devices }
using { /Fortnite.com/FortPlayerUtilities }
using { /Fortnite.com/UI }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath}
using { /UnrealEngine.com/Temporary/UI }
using { /Verse.org/Simulation }
using { /Verse.org/Simulation/Tags } 

util_device := class<public>(creative_device):
    @editable
    SoundCash:audio_player_device = audio_player_device{}
    @editable
    SoundError:audio_player_device = audio_player_device{}

    PlayCashSound<public>(Agent:agent):void=
        SoundCash.Play(Agent)

    PlayErrorSound<public>(Agent:agent):void=
        SoundError.Play(Agent)