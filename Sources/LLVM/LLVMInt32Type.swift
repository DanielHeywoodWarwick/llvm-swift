import LLVMC

@frozen
public struct LLVMInt32Type: LLVMIntType {
    
    @usableFromInline
    internal let _rawType: LLVMTypeRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    public init(in context: LLVMContext) {
        self._rawType = LLVMInt32TypeInContext(context._storage.rawContext)
        self._context = context
    }
    
    @inlinable
    public var opaqueIntType: LLVMOpaqueIntType { LLVMOpaqueIntType(self) }
}
