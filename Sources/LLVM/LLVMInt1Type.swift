import LLVMC

@frozen
public struct LLVMInt1Type: LLVMIntType {
    
    @usableFromInline
    internal let _rawType: LLVMTypeRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    public init(in context: LLVMContext) {
        self._rawType = LLVMInt1TypeInContext(context._storage.rawContext)
        self._context = context
    }
    
    @inlinable
    public var opaqueIntType: LLVMOpaqueIntType { LLVMOpaqueIntType(self) }
}
