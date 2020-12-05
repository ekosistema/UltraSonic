# Static Fields is a Sonic Pi Composition
# static_fields by @ekosistema
# https://github.com/ekosistema
# version 1.0

use_bpm 10

in_thread do
  
  with_fx :compressor do
    with_fx :lpf, cutoff:100 do
      with_fx :reverb, mix: 0.2 do
        
        with_fx :slicer do
          live_loop :pulse do
            use_synth :fm
            play chord(:f0, :major, num_octaves: 1).choose, attack: 8, release: 8, amp: 0.8
            sleep (rand*4)+8
          end
        end
        
        with_fx :krush, cutoff: 80, res: 0.5, mix: 0.5 do
          with_fx :panslicer do
            with_fx :echo, decay: 4 do
              live_loop :pan_hiss do
                sleep (rand+1)*4
                sample :vinyl_hiss, attack: 4, release: 8, amp: 0.4, rate: 0.5
                sleep sample_duration :vinyl_hiss
              end
            end
          end
        end
        
        live_loop :ambience do
          sleep 16
          use_synth :dark_ambience
          play chord(:f2, :major, num_octaves: 2).choose, attack: 12, release: 10, amp: 0.5
          sleep (rand*10)+2
        end
        
        with_fx :echo, decay: 4 do
          live_loop :vinyl do
            sleep rand*4
            sample :vinyl_hiss, attack: 8, release: 8, amp: 1
            sleep sample_duration :vinyl_hiss
            sleep (rand*4)+2
          end
        end
        
        with_fx :echo, decay: 8 do
          live_loop :piano do
            sleep rand*10
            sample :ambi_piano, attack: 8, release: 8, amp: 1, rate: 0.8
            sleep sample_duration :ambi_piano
            sleep (rand*10)+2
          end
        end
      end
    end
  end
end




