# Plain Ambient is a Sonic Pi Composition
# plain_ambient by @ekosistema
# https://github.com/ekosistema
# version 1.0

use_bpm 30

in_thread do
  
  with_fx :compressor do
    with_fx :lpf, cutoff:80 do
      with_fx :hpf, cutoff:40 do
        with_fx :reverb, mix: 0.25 do
          
          live_loop :ambience do
            use_synth :dark_ambience
            play chord(:d2, :minor, num_octaves: 2).choose, attack: 10, release: 16, amp: 1
            sleep (rand*10)+2
          end
          
          with_fx :echo, decay: 4 do
            
            live_loop :texture do
              sleep 4
              sample :ambi_lunar_land, attack: 12, release: 8, amp: 1, rate: 0.8
              sleep sample_duration :ambi_lunar_land
              sleep (rand*10)+2
            end
            
            with_fx :echo, decay: 4 do
              
              live_loop :bell do
                sleep 8
                use_synth :dull_bell
                play chord(:d1, :minor, num_octaves: 2).choose, attack: 1, release: 4, amp: 0.25
                sleep (rand*10)+2
              end
              
              
              live_loop :piano do
                sleep 8
                sample :ambi_piano, attack: 4, release: 8, amp: 1, rate: 1
                sleep sample_duration :ambi_piano
                sleep (rand*10)+2
              end
            end
            
          end
          
        end
      end
    end
  end
  
end
