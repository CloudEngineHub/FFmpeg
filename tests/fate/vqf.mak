FATE_VQF-$(call PCM, VQF, TWINVQ, ARESAMPLE_FILTER) += fate-twinvq
fate-twinvq: CMD = pcm -i $(TARGET_SAMPLES)/vqf/achterba.vqf
fate-twinvq: CMP = oneoff
fate-twinvq: REF = $(SAMPLES)/vqf/achterba.pcm

FATE_VQF-$(call FRAMECRC, VQF) += fate-vqf-demux
fate-vqf-demux: CMD = md5 -i $(TARGET_SAMPLES)/vqf/achterba.vqf -c:a copy -flags bitexact -fflags +bitexact -f framecrc

FATE_VQF += $(FATE_VQF-yes)

FATE_SAMPLES_FFMPEG += $(FATE_VQF)
fate-vqf: $(FATE_VQF)
