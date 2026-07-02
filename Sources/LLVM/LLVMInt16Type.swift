import LLVMC

@frozen
public struct LLVMInt16Type: LLVMType {
    
    @usableFromInline
    internal let _rawType: LLVMTypeRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    public init(in context: LLVMContext) {
        self._rawType = LLVMInt16TypeInContext(context._storage.rawContext)
        self._context = context
    }
    
    @inlinable
    public var opaqueType: LLVMOpaqueType { LLVMOpaqueType(self) }
}
