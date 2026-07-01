import LLVMC

@frozen
public struct LLVMModule {
    
    @usableFromInline
    internal final class _Storage {
        
        @usableFromInline
        internal let rawModule: LLVMModuleRef
        
        @usableFromInline
        internal let context: LLVMContext
        
        @inlinable
        internal init(id: String, in context: LLVMContext) {
            self.rawModule = LLVMModuleCreateWithNameInContext(id, context._storage.rawContext)
            self.context = context
        }
        
        @inlinable
        deinit {
            LLVMDisposeModule(rawModule)
        }
    }
    
    @usableFromInline
    internal let _storage: _Storage
    
    @inlinable
    public init(id: String, in context: LLVMContext) {
        self._storage = _Storage(id: id, in: context)
    }
}
