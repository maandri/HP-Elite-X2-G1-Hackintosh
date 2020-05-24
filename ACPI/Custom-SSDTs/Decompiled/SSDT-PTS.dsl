/*
 * Fixes reboots when shutting down
 */
DefinitionBlock ("", "SSDT", 2, "Slav", "PTS", 0x00000000)
{
    External (_SB_.PCI0.XHC_.PMEE, IntObj)
    External (ZPTS, MethodObj)    // 1 Arguments

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        If (_OSI ("Darwin"))
        {
            If ((0x05 == Arg0))
            {
                \_SB.PCI0.XHC.PMEE = Zero
            }
        }

        ZPTS (Arg0)
    }
}

