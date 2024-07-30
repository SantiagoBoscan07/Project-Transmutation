extends Node

func playDie():
	$Sound/Die.play_with_variance()

func playMainTheme():
	$"Music/main theme".play()

func pauseMainTheme():
	$"Music/main theme".stream_paused = !$"Music/main theme".stream_paused

func stopMainTheme():
	$"Music/main theme".stop()

func playTitleScreen():
	$"Music/title screen".play_with_variance()

func stopTitleScreen():
	$"Music/title screen".stop()

func playConfirm():
	$Sound/confirm.play_with_variance()
