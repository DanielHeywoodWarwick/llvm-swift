import LLVMC

@frozen
public struct LLVMVoidType: LLVMType {
    
    @usableFromInline
    internal let _rawType: LLVMTypeRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    public init(in context: LLVMContext) {
        self._rawType = LLVMVoidTypeInContext(context._storage.rawContext)
        self._context = context
    }
}
