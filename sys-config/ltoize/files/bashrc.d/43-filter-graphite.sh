LTOFilterGraphite()
{
	if ! has_version "sys-config/ltoize[graphite]"; then
		FlagExecute *FLAGS-="-fgraphite-identity -floop-nest-optimize"
	fi
}

LTOFilterGraphiteNote()
{
	if ! has_version "sys-config/ltoize[graphite]" && has_version "sys-devel/gcc[graphite]"; then
		ewarn "${GRAPHITE} flags have been filtered because you have emerged ltoize without \
		graphite. However, GCC has been emerged graphite support. Did you mean to do this?"
	fi
}

BashrcdPhase all LTOFilterGraphite
BashrcdPhase postinst LTOFilterGraphiteNote
