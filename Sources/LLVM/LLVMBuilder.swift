import LLVMC

@frozen
public struct LLVMBuilder {
    
    @usableFromInline
    internal final class _Storage {
        
        @usableFromInline
        internal let rawBuilder: LLVMBuilderRef
        
        @usableFromInline
        internal let context: LLVMContext
        
        @inlinable
        internal init(in context: LLVMContext) {
            self.rawBuilder = LLVMCreateBuilderInContext(context._storage.rawContext)
            self.context = context
        }
        
        @inlinable
        deinit {
            LLVMDisposeBuilder(rawBuilder)
        }
    }
    
    @usableFromInline
    internal let _storage: _Storage
    
    @inlinable
    public init(in context: LLVMContext) {
        self._storage = _Storage(in: context)
    }
}
