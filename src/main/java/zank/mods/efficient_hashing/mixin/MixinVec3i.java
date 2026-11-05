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
 * <p>Production build: targets the intermediary class name directly, because
 * this jar is built without a Loom-generated refmap.</p>
 *
 * @author ZZZank
 */
@Mixin(targets = "net.minecraft.class_2382")
public abstract class MixinVec3i {

    @Shadow
    private int field_11175; // x

    @Shadow
    private int field_11174; // y

    @Shadow
    private int field_11173; // z

    /**
     * @author ZZZank
     * @reason use another algorithm with much less hash collision in general
     */
    @Override
    @Overwrite
    public int hashCode() {
        return PhiMix.mix(PhiMix.mix(this.field_11175) + this.field_11174) + this.field_11173;
    }
}
