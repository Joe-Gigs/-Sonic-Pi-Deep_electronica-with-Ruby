use_bpm 120

sync :foo

kick = "/Users/Gigs/Documents/Code/sonic-pi-tracks/eyes/kick.wav"
clap = "/Users/Gigs/Documents/Code/sonic-pi-tracks/eyes/clap.wav"
piano = "/Users/Gigs/Documents/Code/sonic-pi-tracks/eyes/jazzy-piano.wav"
fx = "/Users/Gigs/Documents/Code/sonic-pi-tracks/eyes/abc.wav"
vocal = "/Users/Gigs/Documents/Code/sonic-pi-tracks/eyes/vox.wav"

live_loop :kick do
  with_fx :lpf, cutoff: 75, amp: 1 do
    #sample kick
    sleep 1
  end
end

live_loop :clap do
  ##| sync :kick
  with_fx :lpf, cutoff: 100, mix: 1 do
    sleep 1
    sample clap
    sleep 1
  end
end

live_loop :piano do
  with_fx :reverb, room: 0.50, mix: 1, amp: 1 do
    sync :kick
    #sample piano, pan: 0.25, rate: 0.8, finish: 0.1, amp: 2.5, release: 2
    sleep 8
  end
end


live_loop :arpeggio do
  with_fx :reverb, mix: 0.2 do
    with_synth :dark_ambience do
      #play_pattern_timed scale(:cb2, :minor), 0.125, release: 0.1, amp: 5
      sleep 4
    end
  end
end

live_loop :hiss do
  sample :vinyl_hiss, amp: 0.1
  sleep 0.50
end

live_loop :hat do
  ##| sync :kick
  with_fx :lpf do
    sleep 0.50
    sample :drum_cymbal_closed, release: 0.3
    sleep 0.50
  end
end

#lead

live_loop :second_synth do
  with_fx :reverb, mix: 0.4, room: 1 do
    with_synth :fm do
      notes = (ring 56, 70)
      #play notes, attack: 2, sustain: 0.2, release: 2, amp: 0.4
      sleep 16
    end
  end
end



live_loop :fx do
  with_fx :reverb, amp: 1, mix: 2, damp: 0.1234 do
    with_fx :lpf, cutoff: 80, amp: 0.1 do
      with_fx :echo do
        with_synth :mod_fm do
          play chord(56, :minor)
          sleep 1
        end
      end
    end
  end
end

live_loop :human do
  with_fx :reverb do
    sample vocal, amp: 0.06, rate: 0.8, start: 0.1, finish: 0.4
    sleep 16
  end
end





