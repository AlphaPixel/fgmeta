aircraftTypeTags = [
    "aerobatic",
    "airship",
    "balloon",
    "bizjet",
    "bomber",
    "cargo",
    "fighter",
    "ga",
    "glider",
    "groundvehicle",
    "helicopter",
    "spaceship",
    "tanker",
    "trainer",
    "transport",
    "ultralight",
    "seacraft",
    "crop-duster",
    "bush-plane"
]

manufacturerTags = [
    "airbus",
    "avro",
    "bell",
    "boeing",
    "bombardier",
    "cessna",
	"consolidated",
    "dassault",
    "diamond",
    "douglas",
    "embraer",
    "eurocopter",
    "fairchild",
    "fairey",
	"focke-wulf",
    "fokker",
    "general-dynamics",
    "grumman",
	"handley page"
	"heinkel"
    "lockheed",
	"mitsubishi",
    "northrop",
    "pilatus",
    "piper",
    "robin",
	"short",
	"supermarine",
    "vickers",
    "vought",
    "yakovlev"
]

eraTags = [
    "1910s",
    "1920s",
    "1930s",
    "1940s",
    "1950s",
    "1960s",
    "1970s",
    "1980s",
    "1990s",
    "2000s",
    "2010s",
    "coldwar",
    "early-pioneers",
    "golden-age",
    "gulfwar1",
    "gulfwar2",
    "vietnam",
    "ww1",
    "ww2"
]

featureTags = [
    "aerobatic",
    "airship",
    "amphibious",
    "biplane",
    "canard",
    "castering-wheel",
    "delta",
    "etops",
    "experimental",
    "fictional",
    "fixed-gear",
    "floats",
    "glass-cockpit",
    "high-wing",
    "hud",
    "ifr",
    "prototype",
    "refuel",
    "retractable-gear",
    "seaplane",
    "skis",
    "stol",
    "supersonic",
    "t-tail",
    "tail-dragger",
    "tricycle",
    "tail-hook",
    "triplane",
    "v-tail",
    "variable-geometry",
    "vtol",
    "wing-fold"
]

propulsionTags = [
    "afterburner",
    "diesel",
    "electric",
    "jet",
    "propeller",
    "piston",
    "radial",
    "rocket",
    "single-engine",
    "supercharged",
    "turboprop",
    "twin-engine",
    "variable-pitch",
    "fixed-pitch"
]

simFeatureTags = [
    "dual-controls",
    "rembrandt",
    "tow",
    "wildfire"
]

tags = aircraftTypeTags + manufacturerTags + eraTags + simFeatureTags + propulsionTags + featureTags

def isValidTag(maybeTag):
    return maybeTag in tags
