LTOFilterGraphite()
{
	if ! has_version "sys-config/ltoize[graphite]" ; then
		FlagExecute *FLAGS-="-fgraphite-identity -floop-nest-optimize"

			LTOFilterGraphiteNote()
			{
				if ! has_version "sys-devel/gcc[graphite]" ; then
					ewarn  'lto-overlay: Filtered ${GRAPHITE} from *FLAGS due to sys-config/ltoize[-graphite]'
				else
					ewarn  'lto-overlay: Filtered ${GRAPHITE} from *FLAGS despite sys-devel/gcc[graphite]'
				fi
			}
	fi
}

BashrcdPhase all LTOFilterGraphite
BashrcdPhase postinst LTOFilterGraphiteNote

# Attempting to build with ${GRAPHITE} when GCC does not have Graphite support will result in
# "compiler cannot create executables"
# This bashrc.d hook resolves that issue.
