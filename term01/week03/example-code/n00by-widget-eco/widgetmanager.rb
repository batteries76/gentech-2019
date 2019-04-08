$LOAD_PATH << '.'
require 'widget'

class Widget_Manager

    def update_widget(widget)
        found = @warr.select {
            |e| 
            e == widget
        }.first
        if (found != nil)
            found = widget
        end
    end

    def get_widget_array_clone
        @warr.clone
    end

    def get_widgets_as_name_hash
        whash = {}
        @warr.each do |w|
            whash[w.name] = w
        end
        whash
    end

    ## 
    # Returns an array of Widgets having the given valueaud.
    #
    # (min inclusive) for >= min inclusive 
    #
    # (min inclusive, max inclusive) for >= min inclusive and <= max inclusive.
    #
    # It's not overloading but it feels like it? :(
    def get_widgets_by_valueaud(*args)
        puts(args.length)
        if (args.length == 1)
            selected = @warr.select {
                |item|
                item.valueaud >= args[0]
            }
        elsif 
            selected = @warr.select {
                |item|
                item.valueaud >= args[0] && item.valueaud <= args[1]
            }
        end
        selected
    end

    ##
    # Initialise 100 widgets to tool around with...
    #

    RANDOM_MAX_LENGTH_CMS = 100
    RANDOM_MAX_WIDTH_CMS = 50
    RANDOM_MAX_HEIGHT_CMS = 25
    RANDOM_MAX_WEIGHT_GMS = 5
    RANDOM_MAX_VALUE_AUD = 10.0

    def initialise_widgets
        @warr = Array.new

        adjectives = ["hairless","metal","wild","domesticated","abnormal","medicated","massive","impressive","out of control","internet worthy","hilarious","hot","very tactful","bearded","duck-like","slimy","insanely creepy","embarrassed to the bone","self-centered","talking","shaky","deep","sick","zippy","sticky","fluffy","frozen","unholy","painfully honest","bonkers","harsh","greedy","crawly","insane","hideous","twisted","useless","yapping","magical","indecent","arrogant","confused","flirting","high-end","insecure","maniacal","sickened","slippery","stubborn","tripping","costumed","cowardly","haunting","startled","generous","demanding","shivering","nighttime","startling","slap happy","blathering","flickering","rebellious","impertinent","bull headed","hyperactive","outnumbered","territorial","zombie like","mischievous","at-the-ready","house-broken","up-to-no-good","misunderstood","fiercely-loyal","out-of-control","fear-inspiring","intelligent","responsible","reasonable","historical","additional","traditional","unlikely","obviously","competitive","automatic","significant","electronic","electrical","available","difficult","obvious","impressive","confident","informal","every","unable","consistent","expensive","financial","practical","critical","terrible","realistic","efficient","various","relevant","suitable","popular","powerful","lonely","conscious","curious","technical","careful","different","glorious","capable","unhappy","medical","happy","immediate","wonderful","existing","federal","accurate","important","anxious","desperate","visible","afraid","sorry","actual","boring","aware","wooden","angry","recent","pleasant","legal","inner","happy","lucky","basic","latter","mental","southern","civil","ugly","decent","global","tiny","healthy","united","hungry","unfair","content","pleased","cheerful","jovial","jolly","glad","thrilled","elated","gleeful","sunny","absurd","amusing","droll","entertaining","hilarious","ludicrous","playful","ridiculous","silly","whimsical","antic","gas","gay","humdinger","jolly","rich","riot","screaming","slapstick","blithe","capricious","clever","diverting","facetious","farcical","for grins","gelastic","good-humored","hysterical","jocose","jocular","joking","knee-slapper","laughable","merry","mirthful","priceless","riotous","risible","side-splitting","sportive","waggish","witty"]
        
        name_count = 1
        100.times {
            id = name_count
            name = "widget#{name_count}"
            description = adjectives[make_random_num(adjectives.length-1)]
            lengthcm = make_random_num(RANDOM_MAX_LENGTH_CMS)
            widthcm = make_random_num(RANDOM_MAX_WIDTH_CMS)
            heightcm = make_random_num(RANDOM_MAX_HEIGHT_CMS)
            weightgms = make_random_num(RANDOM_MAX_WEIGHT_GMS)
            valueaud = make_random_num(RANDOM_MAX_VALUE_AUD).to_f

            @warr << Widget.new(id,
                name,
                description,
                lengthcm,
                widthcm,
                heightcm,
                weightgms,
                valueaud)

            name_count+=1
        }
    end

    def make_random_num(max_inclusive)
        r = Random.new
        r.rand(max_inclusive)
    end
    private :make_random_num

end