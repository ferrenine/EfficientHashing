package zank.mods.efficient_hashing.mixin;

import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Overwrite;
import org.spongepowered.asm.mixin.Shadow;
import zank.mods.efficient_hashing.PhiMix;

/**
 * Only applying this hashing change to its subclass BlockPos is a bad idea,
 * because some mods might use BlockPos as Vec3i, then two same Vec3i with the
 * same value will have different hashcode.
 *
 * <p>26.3 ships unobfuscated official names, so the mixin targets
 * {@code net.minecraft.core.Vec3i} directly and needs no refmap.</p>
 *
 * @author ZZZank
 */
@Mixin(targets = "net.minecraft.core.Vec3i")
public abstract class MixinVec3i {

    @Shadow
    private int x;

    @Shadow
    private int y;

    @Shadow
    private int z;

    /**
     * @author ZZZank
     * @reason use another algorithm with much less hash collision in general
     */
    @Override
    @Overwrite
    public int hashCode() {
        return PhiMix.mix(PhiMix.mix(this.x) + this.y) + this.z;
    }
}
