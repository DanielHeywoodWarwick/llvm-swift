import LLVMC

@frozen
public struct LLVMInt64Type: LLVMIntType {
    
    @usableFromInline
    internal let _rawType: LLVMTypeRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    public init(in context: LLVMContext) {
        self._rawType = LLVMInt64TypeInContext(context._storage.rawContext)
        self._context = context
    }
    
    @inlinable
    public var opaqueIntType: LLVMOpaqueIntType { LLVMOpaqueIntType(self) }
}
